provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_vpc_peering_connection" "peering_conn" {
  vpc_id      = "${var.vpc_id}"
  peer_vpc_id = "${var.peer_id}"
  auto_accept = true

  tags {
    Name = "VPC peering between ${var.vpc_name} and ${var.peer_name}"
  }
}

