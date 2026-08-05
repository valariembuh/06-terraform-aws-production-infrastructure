variable "ami_id" {
  description = "Amazon Linux AMI"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}

variable "min_size" {

  description = "Minimum number of instances"

  type = number

}


variable "max_size" {

  description = "Maximum number of instances"

  type = number

}


variable "desired_capacity" {

  description = "Desired number of instances"

  type = number

}


variable "vpc_zone_identifier" {

  description = "Subnets where instances will launch"

  type = list(string)

}


variable "target_group_arn" {

  description = "ALB Target Group ARN"

  type = string

}
