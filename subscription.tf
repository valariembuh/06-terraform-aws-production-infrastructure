resource "aws_sns_topic_subscription" "sns_subscription" {

  topic_arn = aws_sns_topic.production_alerts.arn

  protocol = "email"

  endpoint = "mbuhvallery02@gmail.com"

}
