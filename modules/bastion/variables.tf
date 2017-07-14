variable "aws_region" {
  description = "AWS Region"
  default = "us-west-2"
}

variable "bastion_ami" {
  description = "AMI to use for the Bastion"
}

variable "key_name" {
  description = "SSH Keypair Name"
  default     = "Bastion Keypair"
}

variable "key" {
  description = ".pem for ubuntu SSH access"
}

variable "bastion_instance_type" {
  description = "EC2 instance type for the Bastion"
  default     = "t2.micro"
}

variable "security_group" {
  description = "Security Group for the Bastion"
}

variable "bastion_subnet" {
  description = "Subnet for the Bastion"
}

variable "bastion_name" {
  description = "Name of the Bastion"
  default     = "bastion"
}

variable "count" {
  description = "The number of bastion hosts to deploy"
  default     = 1
}

