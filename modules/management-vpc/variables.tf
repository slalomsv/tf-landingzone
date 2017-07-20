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
  default     = "management"
}

variable "public_subnet_name" {
  description = "Name of the public subnet"
  default     = "public"
}

variable "security_subnet_name" {
  description = "Name of the security subnet"
  default     = "security"
}

