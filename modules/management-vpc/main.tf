provider "aws" {
    region = "${var.aws_region}"
}


###########
### VPC ###
###########
resource "aws_vpc" "management" {
  cidr_block                       = "${var.vpc_cidr}"
  instance_tenancy                 = "default"
  assign_generated_ipv6_cidr_block = false
  enable_dns_support               = true
  enable_dns_hostnames             = true

  tags {
    Name = "terraform-${var.vpc_name}"
  }
}


###############
### Subnets ###
###############
data "aws_availability_zones" "available" {}

resource "aws_subnet" "public1" {
  vpc_id                          = "${aws_vpc.management.id}"
  cidr_block                      = "${var.public_subnet_1_cidr}"
  availability_zone               = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch         = true
  assign_ipv6_address_on_creation = false

  tags {
    Name = "terraform-${var.public_subnet_1_name}"
  }
}

resource "aws_subnet" "security1" {
  vpc_id                          = "${aws_vpc.management.id}"
  cidr_block                      = "${var.security_subnet_1_cidr}"
  availability_zone               = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch         = false
  assign_ipv6_address_on_creation = false
  
  tags {
    Name = "terraform-${var.security_subnet_1_name}"
  }
}

resource "aws_subnet" "public2" {
  vpc_id                          = "${aws_vpc.management.id}"
  cidr_block                      = "${var.public_subnet_2_cidr}"
  availability_zone               = "${data.aws_availability_zones.available.names[1]}"
  map_public_ip_on_launch         = true
  assign_ipv6_address_on_creation = false

  tags {
    Name = "terraform-${var.public_subnet_2_name}"
  }
}

resource "aws_subnet" "security2" {
  vpc_id                          = "${aws_vpc.management.id}"
  cidr_block                      = "${var.security_subnet_2_cidr}"
  availability_zone               = "${data.aws_availability_zones.available.names[1]}"
  map_public_ip_on_launch         = false
  assign_ipv6_address_on_creation = false
  
  tags {
    Name = "terraform-${var.security_subnet_2_name}"
  }
}



###############
### Routing ###
###############

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

resource "aws_route_table_association" "public1" {
  subnet_id      = "${aws_subnet.public1.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public2" {
  subnet_id      = "${aws_subnet.public2.id}"
  route_table_id = "${aws_route_table.public.id}"
}

### NAT ###
resource "aws_eip" "nat" {
  vpc        = true
  depends_on = ["aws_internet_gateway.main"]
}

resource "aws_nat_gateway" "main" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.public1.id}"
  depends_on    = ["aws_internet_gateway.main"]
}

resource "aws_route_table" "nat" {
  vpc_id = "${aws_vpc.management.id}"
  
  tags {
    Name = "terraform-${var.vpc_name}-nat"
  }
}

resource "aws_route" "nat" {
  route_table_id         = "${aws_route_table.nat.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.main.id}"
}

resource "aws_route_table_association" "nat1" {
  subnet_id      = "${aws_subnet.security1.id}"
  route_table_id = "${aws_route_table.nat.id}"
}

resource "aws_route_table_association" "nat2" {
  subnet_id      = "${aws_subnet.security2.id}"
  route_table_id = "${aws_route_table.nat.id}"
}

