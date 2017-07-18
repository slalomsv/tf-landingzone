provider "aws" {
  region = "${var.aws_region}"
}


###################
### Management ####
###################
module "management_vpc" {
  source = "../environments/management/vpc"
}


##################
### Production ###
##################
module "prod_standard_vpc" {
  source = "../environments/production/vpc/standard-vpc"
}

module "prod_pci_vpc" {
  source = "../environments/production/vpc/pci-vpc"
}

module "prod_standard_to_pci_peering" {
  source    = "../../modules/vpc-peering"
  vpc_id    = "${module.prod_standard_vpc.vpc_id}"
  vpc_name  = "${module.prod_standard_vpc.vpc_name}"
  peer_id   = "${module.prod_pci_vpc.vpc_id}"
  peer_name = "${module.prod_pci_vpc.vpc_name}"
}


###############
### Staging ###
###############
module "stage_standard_vpc" {
  source = "../environments/stage/vpc/standard-vpc"
}

module "stage_pci_vpc" {
  source = "../environments/stage/vpc/pci-vpc"
}

module "stage_standard_to_pci_peering" {
  source    = "../../modules/vpc-peering"
  vpc_id    = "${module.stage_standard_vpc.vpc_id}"
  vpc_name  = "${module.stage_standard_vpc.vpc_name}"
  peer_id   = "${module.stage_pci_vpc.vpc_id}"
  peer_name = "${module.stage_pci_vpc.vpc_name}"
}

