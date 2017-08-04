variable "aws_region" {
  description = "AWS Region"
  default     = "us-west-2"
}

variable "vpc_name" {
  description = "VPC name to use for resource naming"
}

variable "local_vpc_cidr" {
  description = "CIDR block of the local VPC"
}

variable "remote_vpc_cidrs" {
  description = "CIDR blocks of the remote/management VPC(s) to accept connections from"
  default     = "10.0.0.0/16"
}

variable "vpc_id" {
  description = "VPC To attach the security group to"
}

variable "sg_name" {
  description = "Security Group Name"
  default     = "ssh-private"
}

