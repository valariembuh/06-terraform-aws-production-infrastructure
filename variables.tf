variable "aws_region" {
  description = "AWS region where all infrastructure will be deployed"
  type        = string
}


variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}


variable "public_subnet_a_cidr" {
  description = "CIDR block for Public Subnet A"
  type        = string
}

variable "public_subnet_b_cidr" {
  description = "CIDR block for Public Subnet B"
  type        = string
}


variable "availability_zone_a" {
  description = "Availability Zone for Public Subnet A"
  type        = string
}

variable "availability_zone_b" {
  description = "Availability Zone for Public Subnet B"
  type        = string
}



variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}


variable "ami_id" {
  description = "AMI ID"
  type        = string
}
