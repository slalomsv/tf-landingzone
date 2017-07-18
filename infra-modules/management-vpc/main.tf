provider "aws" {
    region = "${var.aws_region}"
}


###########
### VPC ###
###########
resource "aws_vpc" "management" {
  cidr_block           = "${var.vpc_cidr}"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  
  tags {
    Name = "${var.vpc_name}"
  }
}


###############
### Subnets ###
###############
resource "aws_subnet" "public" {
  vpc_id                  = "${aws_vpc.management.id}"
  cidr_block              = "${var.public_subnet_cidr}"
  map_public_ip_on_launch = true
  
  tags {
    Name = "${var.public_subnet_name}"
  }
}

resource "aws_subnet" "security" {
  vpc_id     = "${aws_vpc.management.id}"
  cidr_block = "${var.security_subnet_cidr}"
  
  tags {
    Name = "${var.security_subnet_name}"
  }
}


########################
### Internet Gateway ###
########################
resource "aws_internet_gateway" "public_gateway" {
  vpc_id = "${aws_vpc.management.id}"
  
  tags {
    Name = "${var.ig_name}"
  }
}

resource "aws_eip" "eip" {
  vpc        = true
  depends_on = ["aws_internet_gateway.public_gateway"]
}

resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.management.id}"
  
  tags {
    Name = "${var.route_table_name}"
  }
}

resource "aws_route" "public" {
  route_table_id         = "${aws_route_table.main.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.public_gateway.id}"
}

resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.main.id}"
}

