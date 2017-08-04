output "vpc_id" {
  value = "${module.prod_standard_vpc.vpc_id}"
}

output "vpc_name" {
  value = "${var.vpc_name}"
}

output "vpc_cidr" {
  value = "${var.vpc_cidr}"
}

output "dmz_route_table_id" {
  value = "${module.prod_standard_vpc.dmz_route_table_id}"
}

output "app_route_table_id" {
  value = "${module.prod_standard_vpc.app_route_table_id}"
}

output "data_route_table_id" {
  value = "${module.prod_standard_vpc.data_route_table_id}"
}

