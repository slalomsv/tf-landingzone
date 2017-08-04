variable "aws_region" {
  description = "AWS Region"
  default     = "us-west-2"
}

variable "vpc_name" {
  description = "VPC name to use for resource naming"
}

variable "vpc_id" {
  description = "VPC To attach the security group to"
}

variable "sg_name" {
  description = "Security Group Name"
  default     = "ssh-public"
}

