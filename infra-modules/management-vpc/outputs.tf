output "vpc_id" {
  value = "${aws_vpc.management.id}"
}

output "public_subnet_id" {
  value = "${aws_subnet.public.id}"
}

output "security_subnet_id" {
  value = "${aws_subnet.security.id}"
}

output "gateway_id" {
  value = "${aws_internet_gateway.public_gateway.id}"
}

output "eip_id" {
  value = "${aws_eip.eip.id}"
}

output "route_table_id" {
  value = "${aws_route_table.main.id}"
}

