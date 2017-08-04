provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_security_group" "elb" {
  name   = "tf-${var.vpc_name}-${var.sg_name}"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"  
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "tf-${var.vpc_name}-${var.sg_name}"
  }
}

