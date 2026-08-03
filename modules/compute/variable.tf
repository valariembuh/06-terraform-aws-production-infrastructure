variable "ami_id" {

  description = "AMI ID for the EC2 instance"

  type = string

}


variable "instance_type" {

  description = "EC2 instance type"

  type = string

}


variable "subnet_id" {

  description = "Subnet where EC2 will be deployed"

  type = string

}


variable "vpc_id" {

  description = "VPC where security group will be created"

  type = string

}
