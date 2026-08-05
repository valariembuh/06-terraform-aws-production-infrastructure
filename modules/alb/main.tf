resource "aws_lb" "acme_alb" {

  name = "acme-alb"

  internal = false

  load_balancer_type = "application"

  security_groups = [

    var.security_group_id

  ]

  subnets = var.subnet_ids

  tags = {

    Name = "acme-alb"

  }

}


resource "aws_lb_target_group" "acme_target_group" {

  name = "acme-target-group"

  port = 80

  protocol = "HTTP"

  vpc_id = var.vpc_id

  health_check {

    path = "/"

    protocol = "HTTP"

    matcher = "200"

    interval = 30

    timeout = 5

    healthy_threshold = 2

    unhealthy_threshold = 2

  }

  tags = {

    Name = "acme-target-group"

  }

}

resource "aws_lb_listener" "acme_listener" {

  load_balancer_arn = aws_lb.acme_alb.arn

  port = 80

  protocol = "HTTP"

  default_action {

    type = "forward"

    target_group_arn = aws_lb_target_group.acme_target_group.arn

  }

}
