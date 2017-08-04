output "vpc_id" {
  value = "${module.management_vpc.vpc_id}"
}

output "vpc_name" {
  value = "${var.vpc_name}"
}

output "vpc_cidr" {
  value = "${var.vpc_cidr}"
}

output "public_route_table_id" {
  value = "${module.management_vpc.public_route_table_id}"
}

output "security_route_table_id" {
  value = "${module.management_vpc.security_route_table_id}"
}

