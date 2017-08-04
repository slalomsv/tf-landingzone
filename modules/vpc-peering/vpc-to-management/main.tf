provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_vpc_peering_connection" "main" {
  vpc_id      = "${var.vpc_id}"
  peer_vpc_id = "${var.management_id}"
  auto_accept = true

  tags {
    Name = "tf-${var.vpc_name}-to-management"
  }
}

#########################
### VPC To Management ###
#########################
resource "aws_route" "dmz_to_management" {
  route_table_id            = "${var.dmz_route_table_id}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.main.id}"
  destination_cidr_block    = "${var.management_cidr}"
}

resource "aws_route" "app_to_management" {
  route_table_id            = "${var.app_route_table_id}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.main.id}"
  destination_cidr_block    = "${var.management_cidr}"
}

resource "aws_route" "data_to_management" {
  route_table_id            = "${var.data_route_table_id}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.main.id}"
  destination_cidr_block    = "${var.management_cidr}"
}


##############################
### Management back to VPC ###
##############################
resource "aws_route" "public_to_vpc" {
  route_table_id            = "${var.public_route_table_id}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.main.id}"
  destination_cidr_block    = "${var.vpc_cidr}"
} 

resource "aws_route" "security_to_vpc" {
  route_table_id            = "${var.security_route_table_id}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.main.id}"
  destination_cidr_block    = "${var.vpc_cidr}"
} 

