provider "aws" {
    region = "${var.aws_region}"
}

module "management_vpc" {
  source               = "../../infra-modules/management-vpc"
  vpc_cidr             = "${var.vpc_cidr}"
  public_subnet_cidr   = "${var.public_subnet_cidr}"
  security_subnet_cidr = "${var.security_subnet_cidr}"
}

module "security_group_ssh" {
  source = "../../infra-modules/security-group/ssh"
  vpc_id = "${module.management_vpc.vpc_id}"
}

module "bastion_host" {
  source         = "../../infra-modules/bastion"
  bastion_ami    = "${data.aws_ami.ubuntu.id}"
  key            = "${var.bastion_key}"
  security_group = "${module.security_group_ssh.security_group_id}"
  bastion_subnet = "${module.management_vpc.public_subnet_id}"
  count          = "${var.bastion_count}"
}

