output "vpc_id" {
  value = "${module.management_vpc.vpc_id}"
}

output "vpc_name" {
  value = "${var.vpc_name}"
}

output "vpc_cidr" {
  value = "${var.vpc_cidr}"
}

output "route_table_id" {
  value = "${module.management_vpc.route_table_id}"
}

