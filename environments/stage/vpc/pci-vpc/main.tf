provider "aws" {
    region = "${var.aws_region}"
}

module "stage_pci_vpc" {
  source                    = "../../../../modules/vpc"
  vpc_name                  = "${var.vpc_name}"
  vpc_cidr                  = "${var.vpc_cidr}"
  public_subnet_cidr        = "${var.public_subnet_cidr}"
  container_subnet_cidr     = "${var.container_subnet_cidr}"
  non_container_subnet_cidr = "${var.non_container_subnet_cidr}"
  database_subnet_cidr      = "${var.database_subnet_cidr}"
}

module "security_group_pci" {
  source = "../../../../modules/security-group/pci"
  vpc_id = "${module.stage_pci_vpc.vpc_id}"
}

