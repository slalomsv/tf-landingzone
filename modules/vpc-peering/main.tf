provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_vpc_peering_connection" "main" {
  vpc_id      = "${var.vpc_id}"
  peer_vpc_id = "${var.peer_id}"
  auto_accept = true

  tags {
    Name = "tf-${var.vpc_name}-to-${var.peer_name}"
  }
}

resource "aws_route" "primary_to_peer" {
  route_table_id            = "${var.route_table_id}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.main.id}"
  destination_cidr_block    = "${var.peer_cidr}"
}

resource "aws_route" "peer_to_primary" {
  count                     = "${var.bidirectional}"
  route_table_id            = "${var.peer_route_table_id}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.main.id}"
  destination_cidr_block    = "${var.vpc_cidr}"
} 

