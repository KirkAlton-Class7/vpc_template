resource "aws_autoscaling_policy" "private_client_asg" {
  name                      = "private-client-asg-policy"
  autoscaling_group_name    = aws_autoscaling_group.private_client_asg.id
  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = 60


  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 40.0
  }
}