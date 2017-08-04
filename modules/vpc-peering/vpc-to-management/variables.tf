variable "aws_region" {
  description = "AWS Region"
  default     = "us-west-2"
}

variable "vpc_name" {
  description = "Name of the VPC owning the peering connection"
}

variable "vpc_id" {
  description = "ID of the VPC owning the peering connection"
}

variable "vpc_cidr" {
  description = "CIDR block of the primary VPC"
}

variable "dmz_route_table_id" {
  description = "Route table ID of the VPC's DMZ subnet"
}

variable "app_route_table_id" {
  description = "Route table ID of the VPC's Application subnet"
}

variable "data_route_table_id" {
  description = "Route table ID of the VPC's Data subnet"
}

variable "management_id" {
  description = "ID of the VPC peer"
}

variable "management_cidr" {
  description = "CIDR block of the VPC peer"
}

variable "public_route_table_id" {
  description = "Route table ID of the Management VPC's Public subnet"
}

variable "security_route_table_id" {
  description = "Route table ID of the Management VPC's Security subnet"
}

