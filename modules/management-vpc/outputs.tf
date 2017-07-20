output "vpc_id" {
  value = "${aws_vpc.management.id}"
}

output "public_subnet_id" {
  value = "${aws_subnet.public.id}"
}

output "security_subnet_id" {
  value = "${aws_subnet.security.id}"
}

output "internet_gateway_id" {
  value = "${aws_internet_gateway.main.id}"
}

output "nat_gateway_id" {
  value = "${aws_nat_gateway.main.id}"
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

