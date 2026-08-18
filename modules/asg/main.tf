resource "aws_launch_template" "this1" {
  name_prefix   = "${var.name}-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  user_data = base64encode(file("${path.module}/userdata.sh"))


  vpc_security_group_ids = [
    var.security_group_id
  ]

  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = var.name
    }
  }
}


resource "aws_autoscaling_group" "this1" {
  name = var.name

  min_size         = var.min_size
  desired_capacity = var.desired_capacity
  max_size         = var.max_size

  vpc_zone_identifier = var.subnet_ids

  health_check_type = "EC2"

  default_instance_warmup = var.default_instance_warmup
  target_group_arns = var.target_group_name_asg
    
  

  launch_template {
    id      = aws_launch_template.this1.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "cpu_target_tracking" {
  name                   = "${var.name}-cpu-target-tracking"
  autoscaling_group_name = aws_autoscaling_group.this1.name
  policy_type             = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 5.0
  }
}