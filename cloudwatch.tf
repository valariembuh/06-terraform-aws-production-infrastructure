resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {

  alarm_name = "acme-high-cpu-alarm"

  alarm_description = "Alarm when EC2 CPU exceeds 70%"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  period = 300

  statistic = "Average"

  threshold = 70


  dimensions = {
    InstanceId = "i-03bd27be2b06caa2e"
  }


  alarm_actions = [
    aws_sns_topic.production_alerts.arn
  ]

}
