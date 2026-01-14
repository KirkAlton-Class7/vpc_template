# Secrets Manager Secret

resource "aws_secretsmanager_secret" "lab_rds_mysql" {
  name = "lab/rds/mysql-${local.name_suffix}"

  tags = {
    Name         = "lab-rds-mysql"
    AppComponent = "credentials"
    DataClass       = "confidential"
  }
}

# Secrets Manager Secret Version
resource "aws_secretsmanager_secret_version" "lab_rds_mysql" {
  secret_id     = aws_secretsmanager_secret.lab_rds_mysql.id
  secret_string = jsonencode({
    username = local.db_credentials.username
    password = local.db_credentials.password
  })
}
