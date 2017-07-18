output "vpc_id" {
  value = "${module.prod_standard_vpc.vpc_id}"
}

output "vpc_name" {
  value = "${var.vpc_name}"
}

output "vpc_cidr" {
  value = "${var.vpc_cidr}"
}

output "route_table_id" {
  value = "${module.aws_route_table.main.id}"
}
