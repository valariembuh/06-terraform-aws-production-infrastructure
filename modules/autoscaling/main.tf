resource "aws_launch_template" "acme_launch_template" {


  name_prefix = "acme-web-"


  image_id = var.ami_id


  instance_type = var.instance_type

 iam_instance_profile {
  name = "EC2-SSM-Profile"
}


  vpc_security_group_ids = [

    var.security_group_id

  ]


  user_data = base64encode(file("${path.root}/user-data.sh"))


  tag_specifications {

    resource_type = "instance"


    tags = {

      Name = "acme-asg-instance"

    }

  }

}

resource "aws_autoscaling_group" "acme_asg" {

  name = "acme-web-asg"

  min_size = var.min_size

  max_size = var.max_size

  desired_capacity = var.desired_capacity

  vpc_zone_identifier = var.vpc_zone_identifier


instance_refresh {

  strategy = "Rolling"

  preferences {

    min_healthy_percentage = 50

  }

}



  target_group_arns = [
    var.target_group_arn
  ]


  launch_template {

    id = aws_launch_template.acme_launch_template.id

    version = "$Latest"

  }


  health_check_type = "EC2"


  tag {

    key = "Name"

    value = "acme-asg-instance"

    propagate_at_launch = true

  }

}

