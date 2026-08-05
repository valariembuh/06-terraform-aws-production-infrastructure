output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.acme_vpc.id
}

output "public_subnet_a_id" {
  description = "ID of Public Subnet A"
  value       = aws_subnet.public_subnet_a.id
}

output "public_subnet_b_id" {
  description = "ID of Public Subnet B"
  value       = aws_subnet.public_subnet_b.id
}
