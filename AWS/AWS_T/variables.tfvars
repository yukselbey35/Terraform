region        = "us-east-1"
cidr_block    = "10.0.0.0/16"
public_cidr_1a = "10.0.1.0/24"
public_cidr_2b = "10.0.2.0/24"
public_cidr_3c = "10.0.3.0/24"
private_cidr_1a = "10.0.11.0/24"
private_cidr_2b = "10.0.12.0/24"
private_cidr_3c = "10.0.13.0/24"
tags = {
  Name    = "Dev_VPC"
  Team    = "DevOps"
  Billing = "CFO"
  Quarter = "3"
  AppName = "Wordpress"
}