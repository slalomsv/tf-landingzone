variable "aws_region" {
  description = "AWS Region"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
}

variable "security_subnet_cidr" {
  description = "CIDR block for the security subnet"
}

variable "vpc_name" {
  description = "Name of the Management VPC"
  default     = "Management"
}

variable "public_subnet_name" {
  description = "Name of the public subnet"
  default     = "Public Subnet"
}

variable "security_subnet_name" {
  description = "Name of the security subnet"
  default     = "Security Subnet"
}

variable "ig_name" {
  description = "Internet Gateway name"
  default     = "Management IG"
}

variable "route_table_name" {
  description = "Management route table name"
  default     = "Management"
}

