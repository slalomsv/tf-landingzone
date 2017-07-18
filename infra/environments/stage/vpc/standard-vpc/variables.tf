variable "aws_region" {
  description = "EC2 Region for the VPC"
  default = "us-west-2"
}

variable "vpc_name" {
  description = "Name of the Staging Open VPC"
  default = "Staging Open"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "143.3.0.0/16"
}

variable "dmz_subnet_cidr" {
  description = "CIDR for the DMZ Subnet"
  default     = "143.3.1.0/24"
}

variable "app_subnet_cidr" {
  description = "CIDR for the Application Subnet"
  default     = "143.3.2.0/24"
}

variable "data_subnet_cidr" {
  description = "CIDR for the Database Subnet"
  default     = "143.3.3.0/24"
}

