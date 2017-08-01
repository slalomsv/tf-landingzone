provider "aws" {
    region = "${var.aws_region}"
}

# Export remote state management
terraform {
  backend "s3" {
    bucket  = "tf-landingzone"
    key     = "us-west-2/live-infra/stage/standard-vpc/terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}

module "stage_standard_vpc" {
  source           = "../../../modules/vpc"
  vpc_name         = "${var.vpc_name}"
  vpc_cidr         = "${var.vpc_cidr}"
  dmz_subnet_cidr  = "${var.dmz_subnet_cidr}"
  app_subnet_cidr  = "${var.app_subnet_cidr}"
  data_subnet_cidr = "${var.data_subnet_cidr}"
}

module "security_group_public" {
  source = "../../../modules/security-groups/public"
  vpc_id = "${module.stage_standard_vpc.vpc_id}"
}

