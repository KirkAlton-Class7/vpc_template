# DB Helper Resources
resource "random_password" "db_password" {
  length           = 20
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# DB Instance Configurations

# Private RDS
resource "aws_db_instance" "lab_mysql" {
  region = "${local.region}"
  allocated_storage    = 10
  db_name              = "lab-mysql"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = local.db_credentials.username
  password             = local.db_credentials.password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  tags = {
    Name = "lab-mysql"
    AppComponent = "db"
    Engine = "MySQL"
    # DataStore = "relational"
    DataClass = "confidential"
  }
}

