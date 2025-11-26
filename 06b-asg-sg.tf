# Private ASG Security Group
resource "aws_security_group" "private_asg" {
  name        = "private_asg_sg"
  description = "Only allow inbound traffic from public-application-lb-sg"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "private-asg-sg"
  }
}

# SG Rule: Allow HTTP Inbound only from Public ALB SG
resource "aws_vpc_security_group_ingress_rule" "allow_inbound_http_from_public_alb_sg" {
  security_group_id            = aws_security_group.private_asg.id
  ip_protocol                  = "tcp"
  from_port                    = 80
  to_port                      = 80
  referenced_security_group_id = aws_security_group.public_alb.id
}

# SG Rule: Allow HTTPS Inbound only from Public ALB SG
resource "aws_vpc_security_group_ingress_rule" "allow_inbound_https_from_public_alb_sg" {
  security_group_id            = aws_security_group.private_asg.id
  ip_protocol                  = "tcp"
  from_port                    = 443
  to_port                      = 443
  referenced_security_group_id = aws_security_group.public_alb.id
}

# SG Rule: Allow SSH Inbound only from Public App SG
resource "aws_vpc_security_group_ingress_rule" "allow_inbound_ssh_from_public_alb_sg" {
  security_group_id            = aws_security_group.private_asg.id
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
  referenced_security_group_id = aws_security_group.public_alb.id
}


# SG Rule: Allow HTTP Outbound IPv4 for Private ASG SG (for package updates)
resource "aws_vpc_security_group_egress_rule" "allow_http_outbound_ipv4_private_asg" {
  security_group_id = aws_security_group.private_asg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  to_port           =  80
  from_port         =  80
}

# SG Rule: Allow HTTPS Outbound IPv4 for Private ASG SG (for package updates)
resource "aws_vpc_security_group_egress_rule" "allow_https_outbound_ipv4_private_asg" {
  security_group_id = aws_security_group.private_asg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  to_port           =  443
  from_port         =  443
}