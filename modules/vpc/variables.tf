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
