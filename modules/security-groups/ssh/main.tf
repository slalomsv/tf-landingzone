provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_security_group" "ssh" {
  name   = "terraform-${var.sg_name}"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress { # Allow ping requests: http://www.networksorcery.com/enp/protocol/icmp/msg8.htm
    from_port   = "8"  
    to_port     = "0"
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"  
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "terraform-${var.sg_name}"
  }
}
