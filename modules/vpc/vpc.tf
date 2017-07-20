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
    Name = "terraform-${var.vpc_name}"
  }
}


###############
### Subnets ###
###############
resource "aws_subnet" "dmz" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.dmz_subnet_cidr}"
  map_public_ip_on_launch = true

  tags {
    Name = "terraform-${var.dmz_subnet_name}"
  }
}

resource "aws_subnet" "app" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.app_subnet_cidr}"

  tags {
    Name = "terraform-${var.app_subnet_name}"
  }
}

resource "aws_subnet" "data" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.data_subnet_cidr}"

  tags {
    Name = "terraform-${var.data_subnet_name}"
  }
}


###############
### Routing ###
###############
resource "aws_eip" "main" {
  vpc        = true
}

### Public ###
resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"
  tags {
    Name = "terraform-${var.vpc_name}-public"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "terraform-${var.vpc_name}-public"
  }
}

resource "aws_route"  "public_route" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.main.id}"
}

resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.dmz.id}"
  route_table_id = "${aws_route_table.public.id}"
}

### NAT ###
resource "aws_nat_gateway" "main" {
  allocation_id = "${aws_eip.main.id}"
  subnet_id     = "${aws_subnet.app.id}"
}
  
resource "aws_route_table" "nat" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "terraform-${var.vpc_name}-nat"
  }
}

resource "aws_route"  "nat_route" {
  route_table_id         = "${aws_route_table.nat.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.main.id}"
}

resource "aws_route_table_association" "nat" {
  subnet_id      = "${aws_subnet.app.id}"
  route_table_id = "${aws_route_table.nat.id}"
}

### Data ###
resource "aws_route_table" "data" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "terraform-${var.vpc_name}-data"
  }
}

resource "aws_route"  "data_route" {
  route_table_id         = "${aws_route_table.data.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.main.id}"
}

resource "aws_route_table_association" "data" {
  subnet_id      = "${aws_subnet.data.id}"
  route_table_id = "${aws_route_table.data.id}"
}

