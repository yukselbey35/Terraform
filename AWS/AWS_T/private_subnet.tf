/*
# Create the 'nat_lb' eip for NAT GW
resource "aws_eip" "nat_lb" {
  vpc  = true #when we get eip the assign this eip to the vpc
  tags = var.tags
}
# Create the 'dev_NAT_gw' NAT GW 
resource "aws_nat_gateway" "dev_NAT_gw" {
  depends_on    = [aws_internet_gateway.dev_IGW] #This force to delete first IGW then delete the NAT GW so we won't have problem during the destroy.
  allocation_id = aws_eip.nat_lb.id
  subnet_id     = aws_subnet.public_1a.id
  tags = {
    Name = "dev gw NAT"
  }
}
*/

# Set the private subnets and use data aws_availability_zones
resource "aws_subnet" "private_1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_cidr_1a
  availability_zone       = data.aws_availability_zones.available.names[0]
  tags                    = var.tags
}
resource "aws_subnet" "private_2b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_cidr_2b
  availability_zone       = data.aws_availability_zones.available.names[1]
  tags                    = var.tags
}
resource "aws_subnet" "private_3c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_cidr_3c
  availability_zone       = data.aws_availability_zones.available.names[2]
  tags                    = var.tags
}
# Create the private route table
resource "aws_route_table" "private_dev_RT" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_IGW.id
  }
  tags = var.tags
}
# Assosiate the private subnets to private route table 
resource "aws_route_table_association" "private_1a_assoc" {
  subnet_id      = aws_subnet.private_1a.id
  route_table_id = aws_route_table.private_dev_RT.id
}

resource "aws_route_table_association" "private_2a_assoc" {
  subnet_id      = aws_subnet.private_2b.id
  route_table_id = aws_route_table.private_dev_RT.id
}

resource "aws_route_table_association" "private_3a_assoc" {
  subnet_id      = aws_subnet.private_3c.id
  route_table_id = aws_route_table.private_dev_RT.id
}

