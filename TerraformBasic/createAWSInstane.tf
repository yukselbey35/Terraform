resource "aws_instance" "vm" {
  ami           = "ami-05803413c51f242b7"
  subnet_id     = "subnet-00a45fb5a9aefb9df"
  instance_type = "t3.micro"
  tags = {
    Name = "my-first-tf-node"
  }
}

