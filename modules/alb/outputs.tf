output "target_group_arn" {

  description = "ARN of the Target Group"

  value = aws_lb_target_group.acme_target_group.arn

}
