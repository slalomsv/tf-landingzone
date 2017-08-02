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
    Name = "tf-${var.vpc_name}"
  }
}


###############
### Subnets ###
###############
resource "aws_subnet" "dmz1" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.dmz_subnet_1_cidr}"
  map_public_ip_on_launch = true

  tags {
    Name = "tf-${var.dmz_subnet_name}-1"
  }
}

resource "aws_subnet" "dmz2" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.dmz_subnet_2_cidr}"
  map_public_ip_on_launch = true

  tags {
    Name = "tf-${var.dmz_subnet_name}-2"
  }
}

resource "aws_subnet" "app1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.app_subnet_1_cidr}"

  tags {
    Name = "tf-${var.app_subnet_name}-1"
  }
}

resource "aws_subnet" "app2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.app_subnet_2_cidr}"

  tags {
    Name = "tf-${var.app_subnet_name}-2"
  }
}

resource "aws_subnet" "data1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.data_subnet_1_cidr}"

  tags {
    Name = "tf-${var.data_subnet_name}-1"
  }
}

resource "aws_subnet" "data2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.data_subnet_2_cidr}"

  tags {
    Name = "tf-${var.data_subnet_name}-2"
  }
}


###############
### Routing ###
###############

### Public ###
resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"
  
  tags {
    Name = "tf-${var.vpc_name}-public"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "tf-${var.vpc_name}-public"
  }
}

resource "aws_route"  "public_route" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.main.id}"
}

resource "aws_route_table_association" "dmz1" {
  subnet_id      = "${aws_subnet.dmz1.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "dmz2" {
  subnet_id      = "${aws_subnet.dmz2.id}"
  route_table_id = "${aws_route_table.public.id}"
}


### NAT ###
resource "aws_eip" "main" {
  vpc        = true
}

resource "aws_nat_gateway" "main" {
  allocation_id = "${aws_eip.main.id}"
  subnet_id     = "${aws_subnet.app1.id}"
}
  
resource "aws_route_table" "nat" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "tf-${var.vpc_name}-nat"
  }
}

resource "aws_route"  "nat_route" {
  route_table_id         = "${aws_route_table.nat.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.main.id}"
}

resource "aws_route_table_association" "app1" {
  subnet_id      = "${aws_subnet.app1.id}"
  route_table_id = "${aws_route_table.nat.id}"
}

resource "aws_route_table_association" "app2" {
  subnet_id      = "${aws_subnet.app2.id}"
  route_table_id = "${aws_route_table.nat.id}"
}


### Data ###
resource "aws_route_table" "data" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "tf-${var.vpc_name}-data"
  }
}

resource "aws_route"  "data_route" {
  route_table_id         = "${aws_route_table.data.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.main.id}"
}

resource "aws_route_table_association" "data1" {
  subnet_id      = "${aws_subnet.data1.id}"
  route_table_id = "${aws_route_table.data.id}"
}

resource "aws_route_table_association" "data2" {
  subnet_id      = "${aws_subnet.data2.id}"
  route_table_id = "${aws_route_table.data.id}"
}

