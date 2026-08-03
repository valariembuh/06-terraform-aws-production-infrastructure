output "vpc_id" {
  description = "ID of the VPC"

  value = aws_vpc.acme_vpc.id
}


output "subnet_id" {
  description = "ID of the public subnet"

  value = aws_subnet.public_subnet.id
}
