output "vpc_id" {
  value = "${aws_vpc.management.id}"
}

output "vpc_name" {
  value = "${var.vpc_name}"
}

output "public_subnet_1_id" {
  value = "${aws_subnet.public1.id}"
}

output "security_subnet_1_id" {
  value = "${aws_subnet.security1.id}"
}

output "public_subnet_2_id" {
  value = "${aws_subnet.public2.id}"
}

output "security_subnet_2_id" {
  value = "${aws_subnet.security2.id}"
}

output "internet_gateway_id" {
  value = "${aws_internet_gateway.main.id}"
}

output "nat_gateway_id" {
  value = "${aws_nat_gateway.main.id}"
}

output "eip_id" {
  value = "${aws_eip.nat.id}"
}

output "public_route_table_id" {
  value = "${aws_route_table.public.id}"
}

