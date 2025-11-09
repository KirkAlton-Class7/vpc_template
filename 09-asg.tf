
# Auto Scaling Group for Private Client Mixed Instances
resource "aws_autoscaling_group" "private_client_mixed_asg" {
  vpc_zone_identifier = [aws_subnet.private_app_a.id, aws_subnet.private_app_b.id, aws_subnet.private_app_c.id]
  desired_capacity   = 3
  max_size           = 5
  min_size           = 2

  #launch_template {
    #id      = aws_launch_template.private_client_a_asg.id
    #version = "$Latest"
  #}

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.private_client_a_asg.id
        version = "$Latest"
      }
    
      override {
      instance_type     = "t2.micro" # Instance type is always required for any override.
      launch_template_specification {
        launch_template_id = aws_launch_template.private_client_b_asg.id # Override to use Launch Template for Private Client B
        version = "$Latest"
      }      
      }

      override {
      instance_type     = "t3.nano" # Instance type is always required for any override.
      launch_template_specification {
        launch_template_id = aws_launch_template.private_client_c_asg.id # Override to use Launch Template for Private Client C
      }      
      }
    }
  }
}