#Use this file on TerraForm EC2 Instance 
#to use key pairwithout using key pair
# info 

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}