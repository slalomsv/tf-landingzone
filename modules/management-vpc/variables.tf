variable "aws_region" {
  description = "AWS Region"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for the first public subnet"
  default     = "10.0.1.0/16"
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for the second public subnet"
  default     = "10.0.2.0/16"
}

variable "security_subnet_1_cidr" {
  description = "CIDR block for the first security subnet"
  default     = "10.0.3.0/16"
}

variable "security_subnet_2_cidr" {
  description = "CIDR block for the second security subnet"
  default     = "10.0.4.0/16"
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

