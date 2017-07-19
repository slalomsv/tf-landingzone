variable "aws_region" {
  description = "AWS Region"
  default = "us-west-2"
}

variable "vpc_name" {
  description = "Name of the management VPC"
  default = "Management"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "143.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the Public Subnet"
  default     = "143.0.0.0/24"
}

variable "security_subnet_cidr" {
  description = "CIDR for the Security Subnet"
  default     = "143.0.1.0/24"
}

variable "bastion_count" {
  description = "The number of bastion hosts to deploy"
  default     = 1
}

variable "bastion_key" {
  description = ".pem for ubuntu SSH access"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJdbACw5kqJDDgAQcdnC6wcWsormTHzYYlLBfoWArAs3MTqWrqfKm3Nag/x+nbbGq8jVynO/055WgBtZYo0J0BmpmjgL4L5z9oNhS5/3PwPSrq9b9EQ6Fiao5qG59w8SCvFeRIlUK41AC/45l7GwgJSpxysTk+q70r+OBV+g33uiytPmYR3Ke6Ym8K8JmI+6j1GhS2zZpfJTfm5jgHVnN7/A2j4wOln4EhJDcSkkCdde6mNIUzVYAd5dZrIn+Y8QMdmDUmj/oVZzDDRj+GRof42VC/oLDVss/2O2L6/bVcEsiVcX+Uf2l7NF3PtYtkZ6iNdCXHuyMa8eH1IO2UAriz ubuntu@ubuntu"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

