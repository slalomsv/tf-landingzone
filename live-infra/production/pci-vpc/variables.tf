variable "aws_region" {
  description = "AWS Region"
  default = "us-west-2"
}

variable "vpc_name" {
  description = "Name of the Production PCI VPC"
  default = "prod-pci"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "10.2.0.0/16"
}

variable "dmz_subnet_1_cidr" {
  description = "CIDR for the DMZ Subnet"
  default     = "10.2.7.0/24"
}

variable "dmz_subnet_2_cidr" {
  description = "CIDR for the DMZ Subnet"
  default     = "10.2.8.0/24"
}

variable "app_subnet_1_cidr" {
  description = "CIDR for the Application Subnet"
  default     = "10.2.9.0/24"
}

variable "app_subnet_2_cidr" {
  description = "CIDR for the Application Subnet"
  default     = "10.2.10.0/24"
}

variable "data_subnet_1_cidr" {
  description = "CIDR for the Data Subnet"
  default     = "10.2.11.0/24"
}

variable "data_subnet_2_cidr" {
  description = "CIDR for the Data Subnet"
  default     = "10.2.12.0/24"
}

variable "example_ws_asg_name" {
  description = "Name of the ASG belonging to the example webserver"
  default     = "ws-example"
}

variable "example_ws_elb_name" {
  description = "Name of the ELB belonging to the example webserver"
  default     = "ws-example"
}

variable "example_ws_lc_name" {
  description = "Name of the Launch Configuration for the example webserver"
  default     = "ws-example"
}

