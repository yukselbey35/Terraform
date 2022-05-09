# Create the internet gateway gw
resource "aws_internet_gateway" "dev_IGW" {
  vpc_id = aws_vpc.main.id
  tags = var.tags
}