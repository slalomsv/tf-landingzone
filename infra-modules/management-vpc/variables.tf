variable "aws_region" {
  description = "AWS Region to launch the VPC and subnets"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC, e.g. 10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet, e.g. 10.0.1.0/24"
}

variable "security_subnet_cidr" {
  description = "CIDR block for the security subnet, e.g. 10.0.2.0/24"
}

variable "vpc_name" {
  description = "Name of the Management VPC"
  default     = "Management"
}

variable "public_subnet_name" {
  description = "Name of the public subnet in the Management VPC"
  default     = "Public Subnet"
}

variable "security_subnet_name" {
  description = "Name of the security subnet in the Management VPC"
  default     = "Security Subnet"
}

variable "ig_name" {
  description = "Internet Gateway name"
  default     = "Management IG"
}

variable "route_table_name" {
  description = "Management route table name"
  default     = "Management route table"
}

