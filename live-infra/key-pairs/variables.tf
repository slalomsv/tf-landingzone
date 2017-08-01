variable "aws_region" {
  description = "AWS Region"
  default     = "us-west-2"
}

variable "main_key_name" {
  description = "EC2 SSH key name"
  default     = "tf-landingzone"
}

variable "main_key" {
  description = "SSH public key"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJdbACw5kqJDDgAQcdnC6wcWsormTHzYYlLBfoWArAs3MTqWrqfKm3Nag/x+nbbGq8jVynO/055WgBtZYo0J0BmpmjgL4L5z9oNhS5/3PwPSrq9b9EQ6Fiao5qG59w8SCvFeRIlUK41AC/45l7GwgJSpxysTk+q70r+OBV+g33uiytPmYR3Ke6Ym8K8JmI+6j1GhS2zZpfJTfm5jgHVnN7/A2j4wOln4EhJDcSkkCdde6mNIUzVYAd5dZrIn+Y8QMdmDUmj/oVZzDDRj+GRof42VC/oLDVss/2O2L6/bVcEsiVcX+Uf2l7NF3PtYtkZ6iNdCXHuyMa8eH1IO2UAriz"
}

