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

module "management_vpc" {
  source               = "../../modules/management-vpc"
  vpc_cidr             = "${var.vpc_cidr}"
  public_subnet_cidr   = "${var.public_subnet_cidr}"
  security_subnet_cidr = "${var.security_subnet_cidr}"
}

module "security_group_ssh" {
  source = "../../modules/security-group/ssh"
  vpc_id = "${module.management_vpc.vpc_id}"
}

module "bastion_host" {
  source         = "../../modules/bastion"
  bastion_ami    = "${data.aws_ami.ubuntu.id}"
  key            = "${var.bastion_key}"
  security_group = "${module.security_group_ssh.security_group_id}"
  bastion_subnet = "${module.management_vpc.public_subnet_id}"
  count          = "${var.bastion_count}"
}

