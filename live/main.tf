provider "aws" {
  region = "${var.aws_region}"
}


###################
### Management ####
###################
module "management_vpc" {
  source = "../env-modules/management"
}


##################
### Production ###
##################
module "prod_standard_vpc" {
  source = "../env-modules/production/standard-vpc"
}

module "prod_pci_vpc" {
  source = "../env-modules/production/pci-vpc"
}

module "prod_standard_to_pci_peering" {
  source         = "../infra-modules/vpc-peering"
  route_table_id = "${module.prod_standard_vpc.route_table_id}"
  vpc_id         = "${module.prod_standard_vpc.vpc_id}"
  vpc_name       = "${module.prod_standard_vpc.vpc_name}"
  peer_id        = "${module.prod_pci_vpc.vpc_id}"
  peer_name      = "${module.prod_pci_vpc.vpc_name}"
  peer_cidr      = "${module.prod_pci_vpc.vpc_cidr}"
}


###############
### Staging ###
###############
module "stage_standard_vpc" {
  source = "../env-modules/stage/standard-vpc"
}

module "stage_pci_vpc" {
  source = "../env-modules/stage/pci-vpc"
}

module "stage_standard_to_pci_peering" {
  source         = "../infra-modules/vpc-peering"
  route_table_id = "${module.stage_standard_vpc.route_table_id}"
  vpc_id         = "${module.stage_standard_vpc.vpc_id}"
  vpc_name       = "${module.stage_standard_vpc.vpc_name}"
  peer_id        = "${module.stage_pci_vpc.vpc_id}"
  peer_name      = "${module.stage_pci_vpc.vpc_name}"
  peer_cidr      = "${module.stage_pci_vpc.vpc_cidr}"
}

