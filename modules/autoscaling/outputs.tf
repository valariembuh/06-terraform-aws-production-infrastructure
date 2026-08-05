output "autoscaling_group_id" {

  description = "ID of the Auto Scaling Group"

  value = aws_autoscaling_group.acme_asg.id

}


output "autoscaling_group_arn" {

  description = "ARN of the Auto Scaling Group"

  value = aws_autoscaling_group.acme_asg.arn

}


output "autoscaling_group_name" {

  description = "Name of the Auto Scaling Group"

  value = aws_autoscaling_group.acme_asg.name

}
