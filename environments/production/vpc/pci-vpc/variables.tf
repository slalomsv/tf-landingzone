variable "aws_region" {
  description = "EC2 Region for the VPC"
  default = "us-west-2"
}

variable "vpc_name" {
  description = "Name of the PCI Open VPC"
  default = "Production PCI"
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default     = "143.2.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the Public Subnet"
  default     = "143.2.1.0/24"
}

variable "container_subnet_cidr" {
  description = "CIDR for the Container Subnet"
  default     = "143.2.2.0/24"
}

variable "non_container_subnet_cidr" {
  description = "CIDR for the Non-Container Subnet"
  default     = "143.2.3.0/24"
}

variable "database_subnet_cidr" {
  description = "CIDR for the Database Subnet"
  default     = "143.2.4.0/24"
}

