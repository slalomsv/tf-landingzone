provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_key_pair" "ssh" {
  key_name   = "${var.key_name}"
  public_key = "${var.key}"
}

resource "aws_instance" "bastion" {
  ami             = "${var.bastion_ami}"
  instance_type   = "${var.bastion_instance_type}"
  subnet_id       = "${var.bastion_subnet}"
  key_name        = "${var.key_name}"
  security_groups = ["${var.security_group}"]
  
  tags {
    Name = "${var.bastion_name}"
  }
}

