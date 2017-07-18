variable "aws_region" {
  description = "EC2 Region for the VPC"
  default = "us-west-2"
}

variable "vpc_name" {
  description = "Name of the PCI VPC"
  default = "Production PCI"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "143.2.0.0/16"
}

variable "dmz_subnet_cidr" {
  description = "CIDR for the Public Subnet"
  default     = "143.2.1.0/24"
}

variable "app_subnet_cidr" {
  description = "CIDR for the Application Subnet"
  default     = "143.2.2.0/24"
}

variable "data_subnet_cidr" {
  description = "CIDR for the Data Subnet"
  default     = "143.2.3.0/24"
}

