provider "aws" {
    region = "${var.aws_region}"
}

module "prod_open_vpc" {
  source                    = "../../../../modules/vpc"
  vpc_cidr                  = "${var.vpc_cidr}"
  public_subnet_cidr        = "${var.public_subnet_cidr}"
  container_subnet_cidr     = "${var.container_subnet_cidr}"
  non_container_subnet_cidr = "${var.non_container_subnet_cidr}"
  database_subnet_cidr      = "${var.database_subnet_cidr}"
}

module "security_group_public" {
  source = "../../../../modules/security-group/public"
  vpc_id = "${module.prod_open_vpc.vpc_id}"
}

