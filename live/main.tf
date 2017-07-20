provider "aws" {
  region = "${var.aws_region}"
}


###################
### Management ####
###################
module "management_vpc" {
  source = "../env-modules/management"
}

module "management_to_prod_standard_peering" {
  source              = "../infra-modules/vpc-peering"
  route_table_id      = "${module.management_vpc.public_route_table_id}"
  vpc_id              = "${module.management_vpc.vpc_id}"
  vpc_name            = "${module.management_vpc.vpc_name}"
  vpc_cidr            = "${module.management_vpc.vpc_cidr}"
  peer_route_table_id = "${module.prod_standard_vpc.public_route_table_id}"
  peer_id             = "${module.prod_standard_vpc.vpc_id}"
  peer_name           = "${module.prod_standard_vpc.vpc_name}"
  peer_cidr           = "${module.prod_standard_vpc.vpc_cidr}"
  bidirectional       = true
}

module "management_to_prod_pci_peering" {
  source              = "../infra-modules/vpc-peering"
  route_table_id      = "${module.management_vpc.nat_route_table_id}"
  vpc_id              = "${module.management_vpc.vpc_id}"
  vpc_name            = "${module.management_vpc.vpc_name}"
  vpc_cidr            = "${module.management_vpc.vpc_cidr}"
  peer_route_table_id = "${module.prod_pci_vpc.nat_route_table_id}"
  peer_id             = "${module.prod_pci_vpc.vpc_id}"
  peer_name           = "${module.prod_pci_vpc.vpc_name}"
  peer_cidr           = "${module.prod_pci_vpc.vpc_cidr}"
  bidirectional       = true
}

module "management_to_stage_standard_peering" {
  source              = "../infra-modules/vpc-peering"
  route_table_id      = "${module.management_vpc.public_route_table_id}"
  vpc_id              = "${module.management_vpc.vpc_id}"
  vpc_name            = "${module.management_vpc.vpc_name}"
  vpc_cidr            = "${module.management_vpc.vpc_cidr}"
  peer_route_table_id = "${module.stage_standard_vpc.nat_route_table_id}"
  peer_id             = "${module.stage_standard_vpc.vpc_id}"
  peer_name           = "${module.stage_standard_vpc.vpc_name}"
  peer_cidr           = "${module.stage_standard_vpc.vpc_cidr}"
  bidirectional       = true
}

module "management_to_stage_pci_peering" {
  source              = "../infra-modules/vpc-peering"
  route_table_id      = "${module.management_vpc.nat_route_table_id}"
  vpc_id              = "${module.management_vpc.vpc_id}"
  vpc_name            = "${module.management_vpc.vpc_name}"
  vpc_cidr            = "${module.management_vpc.vpc_cidr}"
  peer_route_table_id = "${module.stage_pci_vpc.nat_route_table_id}"
  peer_id             = "${module.stage_pci_vpc.vpc_id}"
  peer_name           = "${module.stage_pci_vpc.vpc_name}"
  peer_cidr           = "${module.stage_pci_vpc.vpc_cidr}"
  bidirectional       = true
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


###############
### Staging ###
###############
module "stage_standard_vpc" {
  source = "../env-modules/stage/standard-vpc"
}

module "stage_pci_vpc" {
  source = "../env-modules/stage/pci-vpc"
}

