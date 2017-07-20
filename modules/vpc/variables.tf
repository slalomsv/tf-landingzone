variable "aws_region" {
  description = "AWS Region"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
}

variable "dmz_subnet_cidr" {
  description = "CIDR block for the dmz subnet"
}

variable "app_subnet_cidr" {
  description = "CIDR block for the application subnet"
}

variable "data_subnet_cidr" {
  description = "CIDR block for the data subnet"
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

