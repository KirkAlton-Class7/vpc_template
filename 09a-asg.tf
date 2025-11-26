
# Auto Scaling Group for Private Client ASG
resource "aws_autoscaling_group" "private_client_asg" {
  name = "private-client-asg"
  vpc_zone_identifier = [aws_subnet.private_app_a.id,
    aws_subnet.private_app_b.id,
  aws_subnet.private_app_c.id]

  max_size          = 6
  min_size          = 3
  health_check_type = "ELB"
  target_group_arns = [aws_lb_target_group.private_asg_tg.arn] # Target group to attach the ASG to. A list of ARNS is expected for an ASG, so use brackets and add an "s" make "target_group_arn" plural.
  force_delete      = true

  launch_template {
    id      = aws_launch_template.private_client_asg.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "asg-instance"
    propagate_at_launch = true
  }

}