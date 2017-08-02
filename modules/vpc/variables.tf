variable "aws_region" {
  description = "AWS Region"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
}

variable "dmz_subnet_1_cidr" {
  description = "CIDR block for dmz subnet 1"
}

variable "dmz_subnet_2_cidr" {
  description = "CIDR block for dmz subnet 2"
}

variable "app_subnet_1_cidr" {
  description = "CIDR block for application subnet 1"
}

variable "app_subnet_2_cidr" {
  description = "CIDR block for application subnet 2"
}

variable "data_subnet_1_cidr" {
  description = "CIDR block for data subnet 1"
}

variable "data_subnet_2_cidr" {
  description = "CIDR block for data subnet 2"
}

variable "vpc_name" {
  description = "Name of the VPC"
}

variable "dmz_subnet_name" {
  description = "Name of the DMZ subnet"
  default     = "public"
}

variable "app_subnet_name" {
  description = "Name of the Application subnet"
  default     = "application"
}

variable "data_subnet_name" {
  description = "Name of the data subnet"
  default     = "data"
}

