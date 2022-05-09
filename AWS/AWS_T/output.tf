output "vpc" {
  value = aws_vpc.main.id

}

output "public_1a" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public_1a.id
}
output "public_2a" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public_2b.id
}
output "dev_IGW" {
  description = "ID of the internet gateway route"
  value       = aws_internet_gateway.dev_IGW.id
}