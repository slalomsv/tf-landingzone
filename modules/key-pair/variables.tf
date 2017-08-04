variable "aws_region" {
  description = "AWS Region"
  default = "us-west-2"
}

variable "key_name" {
  description = "SSH Keypair Name"
  default     = "tf-landingzone"
}

variable "key" {
  description = ".pem for SSH access"
}

