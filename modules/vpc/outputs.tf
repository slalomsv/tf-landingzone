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

output "internet_gateway_id" {
  value = "${aws_nat_gateway.main.id}"
}

output "nat_gateway_id" {
  value = "${aws_internet_gateway.main.id}"
}

output "eip_id" {
  value = "${aws_eip.main.id}"
}

output "public_route_table_id" {
  value = "${aws_route_table.public.id}"
}

output "nat_route_table_id" {
  value = "${aws_route_table.nat.id}"
}

output "data_route_table_id" {
  value = "${aws_route_table.data.id}"
}

output "vpc_cidr" {
  value = "${var.vpc_cidr}"
}

