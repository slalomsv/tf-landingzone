provider "aws" {
    region = "${var.aws_region}"
}

module "stage_standard_vpc" {
  source           = "../../../infra-modules/vpc"
  vpc_name         = "${var.vpc_name}"
  vpc_cidr         = "${var.vpc_cidr}"
  dmz_subnet_cidr  = "${var.dmz_subnet_cidr}"
  app_subnet_cidr  = "${var.app_subnet_cidr}"
  data_subnet_cidr = "${var.data_subnet_cidr}"
}

module "security_group_public" {
  source = "../../../infra-modules/security-group/public"
  vpc_id = "${module.stage_standard_vpc.vpc_id}"
}
