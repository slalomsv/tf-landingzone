output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "vpc_cidr" {
  value = "${var.vpc_cidr}"
}

output "dmz_subnet_1_id" {
  value = "${aws_subnet.dmz1.id}"
}

output "dmz_subnet_2_id" {
  value = "${aws_subnet.dmz2.id}"
}

output "app_subnet_1_id" {
  value = "${aws_subnet.app1.id}"
}

output "app_subnet_2_id" {
  value = "${aws_subnet.app2.id}"
}

output "data_subnet_1_id" {
  value = "${aws_subnet.data1.id}"
}

output "data_subnet_2_id" {
  value = "${aws_subnet.data2.id}"
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

