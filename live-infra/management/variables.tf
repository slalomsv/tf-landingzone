variable "aws_region" {
  description = "AWS Region"
  default     = "us-west-2"
}

variable "vpc_name" {
  description = "Name of the VPC"
  default     = "mgmt"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "CIDR for the Public Subnet"
  default     = "10.0.1.0/24"
}

variable "security_subnet_1_cidr" {
  description = "CIDR for the Security Subnet"
  default     = "10.0.2.0/24"
}

variable "public_subnet_2_cidr" {
  description = "CIDR for the Public Subnet"
  default     = "10.0.3.0/24"
}

variable "security_subnet_2_cidr" {
  description = "CIDR for the Security Subnet"
  default     = "10.0.4.0/24"
}

variable "bastion_key" {
  description = ".pem for ubuntu SSH access"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJdbACw5kqJDDgAQcdnC6wcWsormTHzYYlLBfoWArAs3MTqWrqfKm3Nag/x+nbbGq8jVynO/055WgBtZYo0J0BmpmjgL4L5z9oNhS5/3PwPSrq9b9EQ6Fiao5qG59w8SCvFeRIlUK41AC/45l7GwgJSpxysTk+q70r+OBV+g33uiytPmYR3Ke6Ym8K8JmI+6j1GhS2zZpfJTfm5jgHVnN7/A2j4wOln4EhJDcSkkCdde6mNIUzVYAd5dZrIn+Y8QMdmDUmj/oVZzDDRj+GRof42VC/oLDVss/2O2L6/bVcEsiVcX+Uf2l7NF3PtYtkZ6iNdCXHuyMa8eH1IO2UAriz ubuntu@ubuntu"
}

variable "bastion_max_size" {
  description = "Maximum number of bastion instances in ASG"
  default     = 3
}

variable "bastion_desired_capacity" {
  description = "Desired number of bastion instances in ASG"
  default     = 2
}

variable "bastion_min_size" {
  description = "Minimum number of bastion instances in ASG"
  default     = 1
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

