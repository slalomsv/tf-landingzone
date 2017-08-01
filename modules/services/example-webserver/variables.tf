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

### ASG and Launch Config ###
variable "asg_name" {
  description = "ASG Name"
  default     = "ws-example"
}

variable "key_name" {
  description = "SSH key for the instances"
}

variable "config_name" {
  description = "The name of the Launch Configuration"
  default     = "web-example"
}

variable "instance_type" {
  description = "EC2 instance type for the instances"
  default     = "t2.micro"
}

variable "lc_security_groups" {
  description = "Security Groups for the launch configuration"
}

variable "asg_subnets" {
  description = "ASG Subnets"
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


### ELB ###
variable "elb_name" {
  description = "Name of the ELB"
  default     = "ws-example"
}

variable "elb_subnets" {
  description = "Subnets to attach the ELB to"
}

variable "elb_security_groups" {
  description = "Security Groups to assign to the ELB"
}

variable "health_interval" {
  description = "The number of seconds between health checks"
  default     = 30
}

variable "healthy_threshold" {
  description = "The number of successful health checks to declare an instance healthy"
  default     = 2
}

variable "unhealthy_threshold" {
  description = "The number of failed health checks to declare an instance unhealthy"
  default     = 2 
}

variable "health_timeout" {
  description = "Timeout in seconds for the health check"
  default     = 5
}

