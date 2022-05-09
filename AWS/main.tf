# Create the VPC
resource "aws_vpc" "feature_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
  }
}

#Create the internetgateway
resource "aws_internet_gateway" "feature_IGW" {
  vpc_id = aws_vpc.feature_vpc.id

  tags = {
    Name = var.IGW_name
  }
}

#Create public subnet
resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = aws_vpc.feature_vpc.id
  cidr_block              = var.cidr_block_public_subnet_1a
  availability_zone       = var.availability_zone_public_subnet_1a
  map_public_ip_on_launch = true

  tags = {
    Name = var.name_public_subnet_1a
  }
}

#Create public subnet
resource "aws_subnet" "public_subnet_1b" {
  vpc_id                  = aws_vpc.feature_vpc.id
  cidr_block              = var.cidr_block_public_subnet_1b
  availability_zone       = var.availability_zone_public_subnet_1b
  map_public_ip_on_launch = true

  tags = {
    Name = var.name_public_subnet_1b
  }
}

#Create private subnet
resource "aws_subnet" "private_subnet_1a" {
  vpc_id                  = aws_vpc.feature_vpc.id
  cidr_block              = var.cidr_block_private_subnet_1a
  availability_zone       = var.availability_zone_private_subnet_1a
  map_public_ip_on_launch = false

  tags = {
    Name = var.private_subnet_1a
  }
}

#Create private subnet 
resource "aws_subnet" "private_subnet_1b" {
  vpc_id                  = aws_vpc.feature_vpc.id
  cidr_block              = var.cidr_block_private_subnet_1b
  availability_zone       = var.availability_zone_private_subnet_1b
  map_public_ip_on_launch = false

  tags = {
    Name = var.private_subnet_1b
  }
}

#  create a VPC public routing table
resource "aws_route_table" "feature_public_RT" {
  vpc_id = aws_vpc.feature_vpc.id

  tags = {
    Name = var.name_public_RT
  }
}

resource "aws_route" "feature_public_route" {
  route_table_id         = aws_route_table.feature_public_RT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.feature_IGW.id

}

resource "aws_route_table_association" "feature_public1a_assoc" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.feature_public_RT.id
}

resource "aws_route_table_association" "feature_public1b_assoc" {
  subnet_id      = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.feature_public_RT.id
}


