variable "region" {}
variable "cidr_block" {}
variable "public_cidr_1a" {}
variable "public_cidr_2b" {}
variable "public_cidr_3c" {}
variable "private_cidr_1a" {}
variable "private_cidr_2b" {}
variable "private_cidr_3c" {}
variable "tags" {
  type = map(string)
}