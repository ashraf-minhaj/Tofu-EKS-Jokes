# why default ones? well I am that lazy bro!!
data "aws_vpc" "vpc" {
  default = true
}

# public subnets
resource "aws_subnet" "vpc_sub_az_a" {
  vpc_id                  = data.aws_vpc.vpc.id
  cidr_block              = var.subnet_cidr_az_a
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"
  tags = {
    app  = "${var.component_prefix}"
    Name = "${var.component_prefix}-${var.component_name}-${var.component_postfix}-sub-az-a"
    env  = "${var.component_postfix}"
  }
}

resource "aws_subnet" "vpc_sub_az_b" {
  vpc_id                  = data.aws_vpc.vpc.id
  cidr_block              = var.subnet_cidr_az_b
  map_public_ip_on_launch = true #tfsec:ignore:no-public-ip-subnet
  availability_zone       = "${var.aws_region}b"
  tags = {
    app  = "${var.component_prefix}"
    Name = "${var.component_prefix}-${var.component_name}-${var.component_postfix}-sub-az-b"
    env  = "${var.component_postfix}"
  }
}

# connect to igw
data "aws_internet_gateway" "vpc_int_gw" {
  # internet_gateway_id = var.internet_gateway
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = data.aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0" # all IPs
    gateway_id = data.aws_internet_gateway.vpc_int_gw.id
  }
  tags = {
    app  = "${var.component_prefix}"
    Name = "${var.component_prefix}-${var.component_name}-${var.component_postfix}-rtable"
    env  = "${var.component_postfix}"
  }
}

# routing association between routetable and subnets
resource "aws_route_table_association" "vpc_sub_az_a_association" {
  subnet_id      = aws_subnet.vpc_sub_az_a.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "vpc_sub_az_b_association" {
  subnet_id      = aws_subnet.vpc_sub_az_b.id
  route_table_id = aws_route_table.route_table.id
}