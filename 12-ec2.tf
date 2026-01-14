# EC2 - Public App EC2
resource "aws_instance" "public_app" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = "t3.micro"
  subnet_id              = local.random_public_subnet
  vpc_security_group_ids = local.ec2_sg
  
  user_data               = templatefile(
    "${path.module}/1a_user_data.sh.tpl",
    {
      region = local.region,
      secret_id = local.secret_id
      }
    )

  associate_public_ip_address = true

  tags = {
    Name = "public-app-ec2"
    Component = "compute"
    AppComponent = "frontend"
  }
}