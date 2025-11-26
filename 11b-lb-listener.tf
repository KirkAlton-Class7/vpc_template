# Public Application Load Balancer 01 - Listener (Forwards traffic to ASG)

resource "aws_lb_listener" "public_app_lb_01" {
  load_balancer_arn = aws_lb.public_app_lb_01.arn
  protocol          = "HTTP"
  port              = "80"
  #ssl_policy        = "ELBSecurityPolicy-2016-08" # Name of SSL Policy for the listener. Required if protocol is HTTPS or TLS. Default is listed here.
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4" # Optional. ARN of the default SSL server certificate. Exactly one certificate is required if protocol is HTTPS.

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.private_asg_tg.arn
  }
}