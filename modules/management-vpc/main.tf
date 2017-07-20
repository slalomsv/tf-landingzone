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
    Name = "terraform-${var.vpc_name}"
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
    Name = "terraform-${var.public_subnet_name}"
  }
}

resource "aws_subnet" "security" {
  vpc_id     = "${aws_vpc.management.id}"
  cidr_block = "${var.security_subnet_cidr}"
  
  tags {
    Name = "terraform-${var.security_subnet_name}"
  }
}


###############
### Routing ###
###############
resource "aws_eip" "main" {
  vpc = true
}


### Public ###
resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.management.id}"
  
  tags {
    Name = "terraform-${var.vpc_name}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.management.id}"
  
  tags {
    Name = "terraform-${var.vpc_name}-public"
  }
}

resource "aws_route" "public" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.main.id}"
}

resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.public.id}"
}

### NAT ###
resource "aws_nat_gateway" "main" {
  allocation_id = "${aws_eip.main.id}"
  subnet_id     = "${aws_subnet.public.id}"
}

