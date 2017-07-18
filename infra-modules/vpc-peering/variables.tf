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

variable "route_table_id" {
  description = "ID of the route table to assosiate the peering connection with"
}

variable "peer_name" {
  description = "Name of the VPC peer"
}

variable "peer_id" {
  description = "ID of the VPC peer"
}

variable "peer_cidr" {
  description = "CIDR block of the VPC peer"
}

