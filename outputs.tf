output "vpc_id" {

  description = "ID of the VPC"

  value = module.vpc.vpc_id

}

output "subnet_a_id" {

  description = "ID of Public Subnet A"

  value = module.vpc.public_subnet_a_id

}

output "subnet_b_id" {

  description = "ID of Public Subnet B"

  value = module.vpc.public_subnet_b_id

}

output "target_group_arn" {

  description = "ARN of the ALB target group"

  value = module.alb.target_group_arn

}


output "sns_topic_arn" {

  description = "SNS Topic ARN"

  value = aws_sns_topic.production_alerts.arn

}
