output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "public_subnet_id" {
  value = "${aws_subnet.public.id}"
}

output "container_subnet_id" {
  value = "${aws_subnet.container.id}"
}

output "non_container_subnet_id" {
  value = "${aws_subnet.non_container.id}"
}

output "database_subnet_id" {
  value = "${aws_subnet.database.id}"
}

output "gateway_id" {
  value = "${aws_internet_gateway.public_gateway.id}"
}

output "eip_id" {
  value = "${aws_eip.eip.id}"
}

output "route_table_id" {
  value = "${aws_route_table.public_route.id}"
}

