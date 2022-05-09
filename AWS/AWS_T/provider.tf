# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

data "aws_availability_zones" "available" {
  state = "available"
}
# Added to create HA VPC