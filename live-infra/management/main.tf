provider "aws" {
    region = "${var.aws_region}"
}

# Export remote state management
terraform {
  backend "s3" {
    bucket  = "tf-landingzone"
    key     = "us-west-2/live-infra/management/terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}

data "terraform_remote_state" "key_pairs" {
  backend = "s3"
  config {
    bucket = "tf-landingzone"
    key    = "us-west-2/live-infra/key-pairs/terraform.tfstate"
    region = "us-west-2"
  }
}

module "management_vpc" {
  source                   = "../../modules/management-vpc"
  vpc_cidr                 = "${var.vpc_cidr}"
  public_subnet_1_cidr     = "${var.public_subnet_1_cidr}"
  security_subnet_1_cidr   = "${var.security_subnet_1_cidr}"
  public_subnet_2_cidr     = "${var.public_subnet_2_cidr}"
  security_subnet_2_cidr   = "${var.security_subnet_2_cidr}"
}

module "security_group_ssh" {
  source = "../../modules/security-groups/ssh"
  vpc_id = "${module.management_vpc.vpc_id}"
}

module "security_group_public" {
  source = "../../modules/security-groups/public"
  vpc_id = "${module.management_vpc.vpc_id}"
}

module "bastion_asg" {
  source             = "../../modules/services/bastion"
  key_name           = "${data.terraform_remote_state.key_pairs.main_key_name}"
  security_group_ids = "${module.security_group_ssh.security_group_id}"
  asg_subnets        = "${module.management_vpc.public_subnet_1_id},${module.management_vpc.public_subnet_2_id}"
  max_size           = "${var.bastion_max_size}"
  desired_capacity   = "${var.bastion_desired_capacity}"
  min_size           = "${var.bastion_min_size}"
}

module "example-ws" {
  source             = "../../modules/services/example-webserver"
  security_group_ids = "${module.security_group_public.security_group_id},${module.security_group_ssh.security_group_id}"
  asg_subnets        = "${module.management_vpc.security_subnet_1_id},${module.management_vpc.security_subnet_2_id}"
  elb_subnets        = "${module.management_vpc.public_subnet_1_id},${module.management_vpc.public_subnet_2_id}"
  key_name           = "${data.terraform_remote_state.key_pairs.main_key_name}"
  max_size           = 3
  desired_capacity   = 2
  min_size           = 1
}

