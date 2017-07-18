provider "aws" {
    region = "${var.aws_region}"
}

module "prod_pci_vpc" {
  source           = "../../../infra-modules/vpc"
  vpc_name         = "${var.vpc_name}"
  vpc_cidr         = "${var.vpc_cidr}"
  dmz_subnet_cidr  = "${var.dmz_subnet_cidr}"
  app_subnet_cidr  = "${var.app_subnet_cidr}"
  data_subnet_cidr = "${var.data_subnet_cidr}"
}

module "security_group_pci" {
  source = "../../../infra-modules/security-group/pci"
  vpc_id = "${module.prod_pci_vpc.vpc_id}"
}

