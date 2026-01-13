# EC2 Instance Configurations

#Public App EC2 (Amazon Linux 2023)
resource "aws_instance" "public_app" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = "t3.micro"
  subnet_id              = local.random_public_subnet
  vpc_security_group_ids = local.ec2_sg
  #key_name = "osaka-key"  # Replace with your key pair name
  
  user_data               = templatefile(
    "${path.module}/1a_user_data.sh.tpl",
    {
      region = local.region,
      secret_id = local.region # PLACEHOLDER. SET UP SECRET AND FIX THIS
      }
    )

  associate_public_ip_address = true

  tags = {
    Name = "Public-App-EC2"
  }
}