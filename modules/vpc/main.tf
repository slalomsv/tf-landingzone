provider "aws" {
    region = "${var.aws_region}"
}

###########
### VPC ###
###########
resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"
  
  tags {
    Name = "${var.vpc_name}"
  }
}


###############
### Subnets ###
###############
resource "aws_subnet" "public" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.public_subnet_cidr}"
  map_public_ip_on_launch = true

  tags {
    Name = "${var.public_subnet_name}"
  }
}

resource "aws_subnet" "container" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.container_subnet_cidr}"

  tags {
    Name = "${var.container_subnet_name}"
  }
}

resource "aws_subnet" "non_container" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.non_container_subnet_cidr}"

  tags {
    Name = "${var.non_container_subnet_name}"
  }
}

resource "aws_subnet" "database" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.database_subnet_cidr}"

  tags {
    Name = "${var.database_subnet_name}"
  }
}


########################
### Internet Gateway ###
########################
resource "aws_internet_gateway" "public_gateway" {
  vpc_id = "${aws_vpc.main.id}"
  tags {
    Name = "${var.ig_name}"
  }
}

resource "aws_eip" "eip" {
  vpc        = true
  depends_on = ["aws_internet_gateway.public_gateway"]
}

resource "aws_route_table" "public_route" {
  vpc_id         = "${aws_vpc.main.id}"
}

resource "aws_route"  "public_route" {
  route_table_id             = "${aws_route_table.public_route.id}"
  destination_cidr_block     = "0.0.0.0/0"
  gateway_id                 = "${aws_internet_gateway.public_gateway.id}"
}

resource "aws_route_table_association" "public" {
  subnet_id = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.public_route.id}"
}

