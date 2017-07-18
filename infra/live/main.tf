provider "aws" {
  region = "${var.aws_region}"
}

module "prod_standard_vpc" {
  source = "../../infra/environments/production/vpc/standard-vpc"
}

module "prod_pci_vpc" {
  source = "../../infra/environments/production/vpc/pci-vpc"
}

module "prod_standard_to_pci_peering" {
  source    = "../../modules/vpc-peering"
  vpc_id    = "${module.prod_standard_vpc.vpc_id}"
  vpc_name  = "${module.prod_standard_vpc.vpc_name}"
  peer_id   = "${module.prod_pci_vpc.vpc_id}"
  peer_name = "${module.prod_pci_vpc.vpc_name}"
}

