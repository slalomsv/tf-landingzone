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
  default     = "10.1.0.0/16"
}

variable "dmz_subnet_1_cidr" {
  description = "CIDR for the DMZ Subnet"
  default     = "10.1.1.0/24"
}

variable "dmz_subnet_2_cidr" {
  description = "CIDR for the DMZ Subnet"
  default     = "10.1.2.0/24"
}

variable "app_subnet_1_cidr" {
  description = "CIDR for the Application Subnet"
  default     = "10.1.3.0/24"
}

variable "app_subnet_2_cidr" {
  description = "CIDR for the Application Subnet"
  default     = "10.1.4.0/24"
}

variable "data_subnet_1_cidr" {
  description = "CIDR for the Data Subnet"
  default     = "10.1.5.0/24"
}

variable "data_subnet_2_cidr" {
  description = "CIDR for the Data Subnet"
  default     = "10.1.6.0/24"
}

variable "example_ws_asg_name" {
  description = "Name of the ASG belonging to the example webserver"
  default     = "prod-standard-ws-example"
}

variable "example_ws_elb_name" {
  description = "Name of the ELB belonging to the example webserver"
  default     = "prod-standard-ws-example"
}

variable "example_ws_lc_name" {
  description = "Name of the Launch Configuration for the example webserver"
  default     = "prod-standard-ws-example"
}

