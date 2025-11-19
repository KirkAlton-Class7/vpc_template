# Public App Security Group
resource "aws_security_group" "public_app" {
  name        = "public_app_sg"
  description = "Allow all inbound/outbound traffic for HTTP, HTTPS and SSH"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "public-application-sg"
  }
}

# SG Rule: Allow all HTTP Inbound for Public App SG
resource "aws_vpc_security_group_ingress_rule" "allow_all_inbound_http_ipv4_public_app" {
  security_group_id = aws_security_group.public_app.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

# SG Rule: Allow all HTTPS Inbound for Public App SG
resource "aws_vpc_security_group_ingress_rule" "allow_all_inbound_https_ipv4_public_app" {
  security_group_id = aws_security_group.public_app.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

# SG Rule: Allow all SSH Inbound for Public App SG
resource "aws_vpc_security_group_ingress_rule" "allow_all_inbound_ssh_ipv4_public_app" {
  security_group_id = aws_security_group.public_app.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# SG Rule: Allow all Outbound IPv4 for Public App SG
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv4_public_app" {
  security_group_id = aws_security_group.public_app.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}




# Bastion Host Security Group
resource "aws_security_group" "bastion_host" {
  name        = "bastion_host_sg"
  description = "Allow RDP access from authorized IPs"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "bastion-host-sg"
  }
}


# SG Rule: Allow RDP Inbound from Authorized IPv4 Addresses for Bastion Host SG
resource "aws_vpc_security_group_ingress_rule" "allow_all_inbound_rdp_ipv4_bastion" {
  security_group_id = aws_security_group.bastion_host.id
  cidr_ipv4         = "73.166.82.125/32" # Replace with your your authorized IP address
  from_port         = 3389
  ip_protocol       = "tcp"
  to_port           = 3389
}

# SG Rule: Allow all Outbound IPv4 for Bastion Host SG
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv4_bastion" {
  security_group_id = aws_security_group.bastion_host.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# Private App Security Group
resource "aws_security_group" "private_app" {
  name        = "private_app_sg"
  description = "Only allow inbound traffic from public-application-sg"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "private-application-sg"
  }
}

# SG Rule: Allow HTTP Inbound only from Public App SG
resource "aws_vpc_security_group_ingress_rule" "allow_inbound_http_from_public_app_sg" {
  security_group_id            = aws_security_group.private_app.id
  from_port                    = 80
  ip_protocol                  = "tcp"
  to_port                      = 80
  referenced_security_group_id = aws_security_group.public_app.id
}

# SG Rule: Allow HTTPS Inbound only from Public App SG
resource "aws_vpc_security_group_ingress_rule" "allow_inbound_https_from_public_app_sg" {
  security_group_id = aws_security_group.private_app.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

# SG Rule: Allow SSH Inbound only from Public App SG
resource "aws_vpc_security_group_ingress_rule" "allow_inbound_ssh_from_public_app_sg" {
  security_group_id            = aws_security_group.private_app.id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22
  referenced_security_group_id = aws_security_group.public_app.id
}

# SG Rule: Allow HTTP Outbound IPv4 for Private App SG (for package updates)
resource "aws_vpc_security_group_egress_rule" "allow_http_outbound_ipv4_private_app" {
  security_group_id = aws_security_group.private_asg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  to_port           =  80
}

# SG Rule: Allow HTTPS Outbound IPv4 for Private App SG (for package updates)
resource "aws_vpc_security_group_egress_rule" "allow_https_outbound_ipv4_private_app" {
  security_group_id = aws_security_group.private_asg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  to_port           =  443
}