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

variable "peer_name" {
  description = "Name of the VPC peer"
}

variable "peer_id" {
  description = "ID of the VPC peer"
}

