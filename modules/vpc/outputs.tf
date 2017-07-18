output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "dmz_subnet_id" {
  value = "${aws_subnet.dmz.id}"
}

output "app_subnet_id" {
  value = "${aws_subnet.app.id}"
}

output "data_subnet_id" {
  value = "${aws_subnet.data.id}"
}

output "gateway_id" {
  value = "${aws_internet_gateway.public_gateway.id}"
}

output "eip_id" {
  value = "${aws_eip.eip.id}"
}

output "route_table_id" {
  value = "${aws_route_table.public_table.id}"
}

output "vpc_cidr" {
  value = "${var.vpc_cidr}"
}

