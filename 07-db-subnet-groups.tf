resource "aws_db_subnet_group" "my_subnet_group" {
  name       = "my-subnet-group"
  subnet_ids = local.private_data_subnets

  tags = {
    Name = "my-subnet-group"
  }
}