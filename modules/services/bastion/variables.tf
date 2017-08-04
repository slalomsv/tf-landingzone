variable "aws_region" {
  description = "AWS Region"
  default = "us-west-2"
}

data "aws_ami" "amazon_linux" {
  most_recent      = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

variable "vpc_name" {
  description = "Name of the VPC used for resource naming"
}

variable "key_name" {
  description = "SSH Keypair Name"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "security_group_ids" {
  description = "Security Groups for the instances"
}

variable "asg_subnets" {
  description = "Subnets for the instances"
}

variable "asg_name" {
  description = "Name of the ASG"
  default     = "bastion"
}

variable "config_name" {
  description = "The name of the Launch Configuration"
  default     = "bastion"
}

variable "max_size" {
  description = "Maximum number of instances in the ASG"
}

variable "min_size" {
  description = "Minimum number of instanves in the ASG"
}

variable "desired_capacity" {
  description = "The desired number of instances running in the group"
}

