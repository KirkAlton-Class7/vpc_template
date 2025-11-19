# Public Application Load Balancer
resource "aws_lb" "public_app_lb_01" {
  name               = "public-app-lb-01"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public_alb.id]
  subnets = [aws_subnet.public_app_a.id,
    aws_subnet.public_app_b.id,
  aws_subnet.public_app_c.id]


  enable_deletion_protection = false

  # Add Access Logs Later
  # access_logs {
  #   bucket  = aws_s3_bucket.lb_logs.id
  #   prefix  = "public-app-lb-01"
  #   enabled = true
  # }

  tags = {
    Name = "public-app-alb-01"
  }
}