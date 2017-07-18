variable "aws_region" {
  description = "AWS Region to launch the VPC and subnets"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC, e.g. 10.0.0.0/16"
}

variable "dmz_subnet_cidr" {
  description = "CIDR block for the dmz subnet, e.g. 10.0.1.0/24"
}

variable "app_subnet_cidr" {
  description = "CIDR block for the app subnet, e.g. 10.0.2.0/24"
}

variable "data_subnet_cidr" {
  description = "CIDR block for the data subnet, e.g. 10.0.3.0/24"
}

variable "vpc_name" {
  description = "Name of the VPC"
}

variable "dmz_subnet_name" {
  description = "Name of the DMZ subnet"
  default     = "Public Subnet"
}

variable "app_subnet_name" {
  description = "Name of the Application subnet"
  default     = "Container Subnet"
}

variable "data_subnet_name" {
  description = "Name of the data subnet"
  default     = "Data Subnet"
}

variable "ig_name" {
  description = "Internet Gateway name"
  default     = ""
}

variable "route_table_name" {
  description = "Route table name"
  default     = ""
}

