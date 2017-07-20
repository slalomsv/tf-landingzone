output "vpc_id" {
  value = "${module.prod_pci_vpc.vpc_id}"
}

output "vpc_name" {
  value = "${var.vpc_name}"
}

output "vpc_cidr" {
  value = "${var.vpc_cidr}"
}

output "public_route_table_id" {
  value = "${module.prod_pci_vpc.public_route_table_id}"
}

output "data_route_table_id" {
  value = "${module.prod_pci_vpc.data_route_table_id}"
}

output "nat_route_table_id" {
  value = "${module.prod_pci_vpc.nat_route_table_id}"
}

