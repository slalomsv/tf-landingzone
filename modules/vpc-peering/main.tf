provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_vpc_peering_connection" "main" {
  vpc_id      = "${var.vpc_id}"
  peer_vpc_id = "${var.peer_id}"
  auto_accept = true

  tags {
    Name = "${var.vpc_name} to ${var.peer_name}"
  }
}

resource "aws_route_table" "main" {
  vpc_id = "${var.vpc_id}"
}

resource "aws_route" "primary_to_secondary" {
  route_table_id = "${aws_route_table.main.id}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.main.id}"
  destination_cidr_block    = "${var.peer_cidr}"
}

