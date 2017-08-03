provider "aws" {
    region = "${var.aws_region}"
}

###############################
### Remote State Management ###
###############################
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


###########
### VPC ###
###########
module "management_vpc" {
  source                   = "../../modules/management-vpc"
  vpc_name                 = "${var.vpc_name}"
  vpc_cidr                 = "${var.vpc_cidr}"
  public_subnet_1_cidr     = "${var.public_subnet_1_cidr}"
  security_subnet_1_cidr   = "${var.security_subnet_1_cidr}"
  public_subnet_2_cidr     = "${var.public_subnet_2_cidr}"
  security_subnet_2_cidr   = "${var.security_subnet_2_cidr}"
}


#######################
### Security Groups ###
#######################
module "security_group_ssh" {
  source   = "../../modules/security-groups/ssh-public"
  vpc_name = "${var.vpc_name}"
  vpc_id   = "${module.management_vpc.vpc_id}"
}

module "security_group_public" {
  source   = "../../modules/security-groups/public"
  vpc_name = "${var.vpc_name}"
  vpc_id   = "${module.management_vpc.vpc_id}"
}

module "security_group_elb" {
  source   = "../../modules/security-groups/elb"
  vpc_name = "${var.vpc_name}"
  vpc_id   = "${module.management_vpc.vpc_id}"
}


################
### Services ###
################
module "bastion_asg" {
  source             = "../../modules/services/bastion"
  vpc_name           = "${module.management_vpc.vpc_name}"
  key_name           = "${data.terraform_remote_state.key_pairs.main_key_name}"
  security_group_ids = "${module.security_group_ssh.security_group_id}"
  asg_subnets        = "${module.management_vpc.public_subnet_1_id},${module.management_vpc.public_subnet_2_id}"
  max_size           = "${var.bastion_max_size}"
  desired_capacity   = "${var.bastion_desired_capacity}"
  min_size           = "${var.bastion_min_size}"
}

