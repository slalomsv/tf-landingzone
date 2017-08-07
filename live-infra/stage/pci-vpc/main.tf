provider "aws" {
    region = "${var.aws_region}"
}

###############################
### Remote State Management ###
###############################
terraform {
  backend "s3" {
    bucket  = "tf-landingzone"
    key     = "us-west-2/live-infra/stage/pci-vpc/terraform.tfstate"
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

data "terraform_remote_state" "management_vpc" {
  backend = "s3"
  config {
    bucket = "tf-landingzone"
    key    = "us-west-2/live-infra/management/terraform.tfstate"
    region = "us-west-2"
  }
}


###########
### VPC ###
###########
module "stage_pci_vpc" {
  source             = "../../../modules/vpc"
  vpc_name           = "${var.vpc_name}"
  vpc_cidr           = "${var.vpc_cidr}"
  dmz_subnet_1_cidr  = "${var.dmz_subnet_1_cidr}"
  dmz_subnet_2_cidr  = "${var.dmz_subnet_2_cidr}"
  app_subnet_1_cidr  = "${var.app_subnet_1_cidr}"
  app_subnet_2_cidr  = "${var.app_subnet_2_cidr}"
  data_subnet_1_cidr = "${var.data_subnet_1_cidr}"
  data_subnet_2_cidr = "${var.data_subnet_2_cidr}"
}


#######################
### Security Groups ###
#######################
module "security_group_pci" {
  source   = "../../../modules/security-groups/pci"
  vpc_name = "${var.vpc_name}"
  vpc_id   = "${module.stage_pci_vpc.vpc_id}"
}

module "security_group_ssh_public" {
  source           = "../../../modules/security-groups/ssh-public"
  vpc_name         = "${var.vpc_name}"
  vpc_id           = "${module.stage_pci_vpc.vpc_id}"
}

module "security_group_ssh_private" {
  source           = "../../../modules/security-groups/ssh-private"
  vpc_name         = "${var.vpc_name}"
  vpc_id           = "${module.stage_pci_vpc.vpc_id}"
  local_vpc_cidr   = "${module.stage_pci_vpc.vpc_cidr}"
  remote_vpc_cidrs = "${data.terraform_remote_state.management_vpc.vpc_cidr}"
}

module "security_group_elb" {
  source   = "../../../modules/security-groups/elb"
  vpc_name = "${var.vpc_name}"
  vpc_id   = "${module.stage_pci_vpc.vpc_id}"
}


###################
### VPC Peering ###
###################
module "management_vpc_peering" {
  source                  = "../../../modules/vpc-peering/vpc-to-management"
  vpc_name                = "${module.stage_pci_vpc.vpc_name}"
  vpc_id                  = "${module.stage_pci_vpc.vpc_id}"
  vpc_cidr                = "${module.stage_pci_vpc.vpc_cidr}"
  dmz_route_table_id      = "${module.stage_pci_vpc.dmz_route_table_id}" 
  app_route_table_id      = "${module.stage_pci_vpc.app_route_table_id}"
  data_route_table_id     = "${module.stage_pci_vpc.data_route_table_id}"
  management_id           = "${data.terraform_remote_state.management_vpc.vpc_id}"
  management_cidr         = "${data.terraform_remote_state.management_vpc.vpc_cidr}"
  public_route_table_id   = "${data.terraform_remote_state.management_vpc.public_route_table_id}" 
  security_route_table_id = "${data.terraform_remote_state.management_vpc.security_route_table_id}"
}

################
### Services ###
################
module "example_ws" {
  source              = "../../../modules/services/example-webserver"
  vpc_name            = "${module.stage_pci_vpc.vpc_name}"
  elb_name            = "${var.example_ws_elb_name}"
  asg_name            = "${var.example_ws_asg_name}"
  lc_name             = "${var.example_ws_lc_name}"
  lc_security_groups  = "${module.security_group_pci.security_group_id},${module.security_group_ssh_private.security_group_id}"
  elb_security_groups = "${module.security_group_elb.security_group_id}"
  asg_subnets         = "${module.stage_pci_vpc.app_subnet_1_id},${module.stage_pci_vpc.app_subnet_2_id}"
  elb_subnets         = "${module.stage_pci_vpc.dmz_subnet_1_id},${module.stage_pci_vpc.dmz_subnet_2_id}"
  key_name            = "${data.terraform_remote_state.key_pairs.main_key_name}"
  max_size            = 3
  desired_capacity    = 2
  min_size            = 1
}

