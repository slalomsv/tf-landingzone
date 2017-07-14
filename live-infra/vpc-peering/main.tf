provider "aws" {
  region = "${var.aws_region}"
}

# Export remote state management
terraform {
  backend "s3" {
    bucket  = "tf-landingzone"
    key     = "us-west-2/live-infra/vpc-peering/terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}

####################
### Data Sources ###
####################
data "terraform_remote_state" "management" {
  backend = "s3"
  config {
    bucket = "tf-landingzone"
    key    = "us-west-2/live-infra/management/terraform.tfstate"
    region = "us-west-2"
  }
}

data "terraform_remote_state" "prod_standard" {
  backend = "s3"
  config {
    bucket = "tf-landingzone"
    key    = "us-west-2/live-infra/production/standard-vpc/terraform.tfstate"
    region = "us-west-2"
  }
}

data "terraform_remote_state" "prod_pci" {
  backend = "s3"
  config {
    bucket = "tf-landingzone"
    key    = "us-west-2/live-infra/production/pci-vpc/terraform.tfstate"
    region = "us-west-2"
  }
}

data "terraform_remote_state" "stage_standard" {
  backend = "s3"
  config {
    bucket = "tf-landingzone"
    key    = "us-west-2/live-infra/stage/standard-vpc/terraform.tfstate"
    region = "us-west-2"
  }
}

data "terraform_remote_state" "stage_pci" {
  backend = "s3"
  config {
    bucket = "tf-landingzone"
    key    = "us-west-2/live-infra/stage/pci-vpc/terraform.tfstate"
    region = "us-west-2"
  }
}


###############
### Peering ###
###############
module "management_to_prod_standard_peering" {
  source              = "../../modules/vpc-peering"
  route_table_id      = "${data.terraform_remote_state.management.public_route_table_id}"
  vpc_id              = "${data.terraform_remote_state.management.vpc_id}"
  vpc_name            = "${data.terraform_remote_state.management.vpc_name}"
  vpc_cidr            = "${data.terraform_remote_state.management.vpc_cidr}"
  peer_route_table_id = "${data.terraform_remote_state.prod_standard.public_route_table_id}"
  peer_id             = "${data.terraform_remote_state.prod_standard.vpc_id}"
  peer_name           = "${data.terraform_remote_state.prod_standard.vpc_name}"
  peer_cidr           = "${data.terraform_remote_state.prod_standard.vpc_cidr}"
  bidirectional       = true
}

module "management_to_prod_pci_peering" {
  source              = "../../modules/vpc-peering"
  route_table_id      = "${data.terraform_remote_state.management.public_route_table_id}"
  vpc_id              = "${data.terraform_remote_state.management.vpc_id}"
  vpc_name            = "${data.terraform_remote_state.management.vpc_name}"
  vpc_cidr            = "${data.terraform_remote_state.management.vpc_cidr}"
  peer_route_table_id = "${data.terraform_remote_state.prod_pci.public_route_table_id}"
  peer_id             = "${data.terraform_remote_state.prod_pci.vpc_id}"
  peer_name           = "${data.terraform_remote_state.prod_pci.vpc_name}"
  peer_cidr           = "${data.terraform_remote_state.prod_pci.vpc_cidr}"
  bidirectional       = true
}

module "management_to_stage_standard_peering" {
  source              = "../../modules/vpc-peering"
  route_table_id      = "${data.terraform_remote_state.management.public_route_table_id}"
  vpc_id              = "${data.terraform_remote_state.management.vpc_id}"
  vpc_name            = "${data.terraform_remote_state.management.vpc_name}"
  vpc_cidr            = "${data.terraform_remote_state.management.vpc_cidr}"
  peer_route_table_id = "${data.terraform_remote_state.stage_standard.public_route_table_id}"
  peer_id             = "${data.terraform_remote_state.stage_standard.vpc_id}"
  peer_name           = "${data.terraform_remote_state.stage_standard.vpc_name}"
  peer_cidr           = "${data.terraform_remote_state.stage_standard.vpc_cidr}"
  bidirectional       = true
}

module "management_to_stage_pci_peering" {
  source              = "../../modules/vpc-peering"
  route_table_id      = "${data.terraform_remote_state.management.public_route_table_id}"
  vpc_id              = "${data.terraform_remote_state.management.vpc_id}"
  vpc_name            = "${data.terraform_remote_state.management.vpc_name}"
  vpc_cidr            = "${data.terraform_remote_state.management.vpc_cidr}"
  peer_route_table_id = "${data.terraform_remote_state.stage_pci.public_route_table_id}"
  peer_id             = "${data.terraform_remote_state.stage_pci.vpc_id}"
  peer_name           = "${data.terraform_remote_state.stage_pci.vpc_name}"
  peer_cidr           = "${data.terraform_remote_state.stage_pci.vpc_cidr}"
  bidirectional       = true
}

