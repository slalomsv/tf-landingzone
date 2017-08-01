provider "aws_region" {
  region = "${var.aws_region}"
}

# Export remote state management
terraform {
  backend "s3" {
    bucket  = "tf-landingzone"
    key     = "us-west-2/live-infra/key-pairs/terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}

module "main" {
  source   = "../../modules/key-pair/"
  key_name = "${var.main_key_name}"
  key      = "${var.main_key}"
}

