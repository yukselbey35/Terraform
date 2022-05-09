# Set the public subnets and use data aws_availability_zones
resource "aws_subnet" "public_1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_cidr_1a
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = var.tags
}

resource "aws_subnet" "public_2b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_cidr_2b
  availability_zone = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true
  tags = var.tags
}

resource "aws_subnet" "public_3c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_cidr_3c
  availability_zone = data.aws_availability_zones.available.names[2]
  map_public_ip_on_launch = true
  tags = var.tags
}
# Create the route table
resource "aws_route_table" "dev_RT" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_IGW.id
  }
  tags = var.tags
}
# Assosiate the subnets to route table 
resource "aws_route_table_association" "public_1a_assoc" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.dev_RT.id
}

resource "aws_route_table_association" "public_2a_assoc" {
  subnet_id      = aws_subnet.public_2b.id
  route_table_id = aws_route_table.dev_RT.id
}

resource "aws_route_table_association" "public_3a_assoc" {
  subnet_id      = aws_subnet.public_3c.id
  route_table_id = aws_route_table.dev_RT.id
}