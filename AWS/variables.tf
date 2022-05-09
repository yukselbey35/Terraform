variable "region_aws" {
  type        = string
  default     = "us-east-1"
  description = "Region"
}

variable "profile_aws" {
  type        = string
  default     = "default"
  description = "Default Profile"
}

variable "vpc_name" {
  type        = string
  default     = "feature-vpc"
  description = "Set the VPC name"
}

variable "IGW_name" {
  type        = string
  default     = "feature_vpc_IGW"
  description = "Set the IGW"
}
#Setting public subnet 1a 
variable "name_public_subnet_1a" {
  type        = string
  default     = "public_subnet_1a"
  description = "Create subnet 1a"
}

variable "cidr_block_public_subnet_1a" {
  type        = string
  default     = "10.0.1.0/24"
  description = "Create subnet for cidr_block_public_subnet_1a"
}

variable "availability_zone_public_subnet_1a" {
  type        = string
  default     = "us-east-1a"
  description = "Set the availability zone"
}

#Setting public subnet 1a 
variable "private_subnet_1a" {
  type        = string
  default     = "private_subnet_1a"
  description = "Create subnet 1a"
}

variable "cidr_block_private_subnet_1a" {
  type        = string
  default     = "10.0.11.0/24"
  description = "Create subnet for cidr_block_private_subnet_1a"
}

variable "availability_zone_private_subnet_1a" {
  type        = string
  default     = "us-east-1a"
  description = "Set the availability zone"
}


#Setting public subnet 1b 
variable "name_public_subnet_1b" {
  type        = string
  default     = "public_subnet_1b"
  description = "Create subnet 1b"
}

variable "cidr_block_public_subnet_1b" {
  type        = string
  default     = "10.0.2.0/24"
  description = "Create subnet for cidr_block_public_subnet_1b"
}

variable "availability_zone_public_subnet_1b" {
  type        = string
  default     = "us-east-1a"
  description = "Set the availability zone"
}

#Setting private subnet 1b 
variable "private_subnet_1b" {
  type        = string
  default     = "private_subnet_1b"
  description = "Create private subnet 1b"
}

variable "cidr_block_private_subnet_1b" {
  type        = string
  default     = "10.0.22.0/24"
  description = "Create subnet for cidr_block_private_subnet_1b"
}

variable "availability_zone_private_subnet_1b" {
  type        = string
  default     = "us-east-1a"
  description = "Set the availability zone"
}

#  create a VPC public routing table
variable "name_public_RT" {
  type        = string
  default     = "public_RT_feature_env"
  description = "Set the routing table"
}
