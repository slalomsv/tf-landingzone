variable "aws_region" {
  description = "EC2 Region for the VPC"
  default = "us-west-2"
}

variable "vpc_name" {
  description = "Name of the Production Open VPC"
  default = "Production Open"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "143.1.0.0/16"
}

variable "dmz_subnet_cidr" {
  description = "CIDR for the DMZ Subnet"
  default     = "143.1.1.0/24"
}

variable "app_subnet_cidr" {
  description = "CIDR for the Application Subnet"
  default     = "143.1.2.0/24"
}

variable "data_subnet_cidr" {
  description = "CIDR for the Data Subnet"
  default     = "143.1.3.0/24"
}
