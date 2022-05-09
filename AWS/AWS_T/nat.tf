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