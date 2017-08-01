provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_security_group" "public" {
  name   = "terraform-${var.sg_name}"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "8081"
    to_port     = "8081"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "8088"
    to_port     = "8088"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "8090"
    to_port     = "8090"
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

