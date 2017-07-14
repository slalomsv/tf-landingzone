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

variable "container_subnet_cidr" {
  description = "CIDR block for the container subnet, e.g. 10.0.2.0/24"
}

variable "non_container_subnet_cidr" {
  description = "CIDR block for the non-container subnet, e.g. 10.0.2.0/24"
}

variable "database_subnet_cidr" {
  description = "CIDR block for the database subnet, e.g. 10.0.2.0/24"
}

variable "vpc_name" {
  description = "Name of the VPC"
}

variable "public_subnet_name" {
  description = "Name of the public subnet VPC"
  default     = "Public Subnet"
}

variable "container_subnet_name" {
  description = "Name of the container subnet VPC"
  default     = "Container Subnet"
}

variable "non_container_subnet_name" {
  description = "Name of the non-container subnet VPC"
  default     = "Non-container Subnet"
}

variable "database_subnet_name" {
  description = "Name of the database subnet VPC"
  default     = "Database Subnet"
}

variable "ig_name" {
  description = "Internet Gateway name"
  default     = ""
}

variable "route_table_name" {
  description = "Route table name"
  default     = ""
}

