variable "aws_region" {
  description = "AWS Region"
  default = "us-west-2"
}

variable "vpc_name" {
  description = "Name of the Production Standard VPC"
  default = "production-standard"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "10.3.0.0/16"
}

variable "dmz_subnet_cidr" {
  description = "CIDR for the DMZ Subnet"
  default     = "10.3.1.0/24"
}

variable "app_subnet_cidr" {
  description = "CIDR for the Application Subnet"
  default     = "10.3.2.0/24"
}

variable "data_subnet_cidr" {
  description = "CIDR for the Data Subnet"
  default     = "10.3.3.0/24"
}

