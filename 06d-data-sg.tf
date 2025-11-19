# Private Data Security Groups and Rules (Common Database Ports)

# Redis/Memcache SG
resource "aws_security_group" "private_data_redis" {
  name        = "private_data_redis_sg"
  description = "Allow local traffic for private data resources"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "private-data-redis-sg"
  }
}

# SG Rule: Allow Redis/Memcache Inbound only from Private App SG
resource "aws_vpc_security_group_ingress_rule" "allow_inbound_redis_from_private_app_sg" {
  security_group_id            = aws_security_group.private_data_redis.id
  from_port                    = 6379
  ip_protocol                  = "tcp"
  to_port                      = 6379
  referenced_security_group_id = aws_security_group.private_app.id
}

# # SG Rule: Allow Internal Outbound IPv4 for Redis/Memcache SG
# resource "aws_vpc_security_group_egress_rule" "allow_internal_outbound_ipv4_redis" {
#   security_group_id = aws_security_group.private_data_redis.id
#   cidr_ipv4         = aws_vpc.main.cidr_block
#   ip_protocol       = "tcp"
#   to_port           = 6379
# }


# MySQL SG
resource "aws_security_group" "private_data_mysql" {
  name        = "private_data_mysql_sg"
  description = "Allow local traffic for private data resources"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "private-data-mysql-sg"
  }
}

# SG Rule: Allow MySQL Inbound only from Private App SG
resource "aws_vpc_security_group_ingress_rule" "allow_inbound_mysql_from_private_app_sg" {
  security_group_id            = aws_security_group.private_data_mysql.id
  from_port                    = 3306
  ip_protocol                  = "tcp"
  to_port                      = 3306
  referenced_security_group_id = aws_security_group.private_app.id
}

# # SG Rule: Allow Internal Outbound Traffic for MySQL SG
# resource "aws_vpc_security_group_egress_rule" "allow_internal_outbound_ipv4_mysql" {
#   security_group_id = aws_security_group.private_data_mysql.id
#   cidr_ipv4         = aws_vpc.main.cidr_block
#   ip_protocol       = "tcp"
#   to_port           = 3306
# }


# PostgreSQL SG
resource "aws_security_group" "private_data_postgresql" {
  name        = "private_data_postgresql_sg"
  description = "Allow local traffic for private data resources"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "private-data-postgresql-sg"
  }
}

# SG Rule: Allow PostgreSQL Inbound only from Private App SG
resource "aws_vpc_security_group_ingress_rule" "allow_inbound_postgresql_from_private_app_sg" {
  security_group_id            = aws_security_group.private_data_postgresql.id
  from_port                    = 5432
  ip_protocol                  = "tcp"
  to_port                      = 5432
  referenced_security_group_id = aws_security_group.private_app.id
}

# # SG Rule: Allow Internal Outbound Traffic for PostgreSQL SG
# resource "aws_vpc_security_group_egress_rule" "allow_internal_outbound_ipv4_postgresql" {
#   security_group_id = aws_security_group.private_data_postgresql.id
#   cidr_ipv4         = aws_vpc.main.cidr_block
#   ip_protocol       = "tcp"
#   to_port           = 5432
# }


# Oracle SG
resource "aws_security_group" "private_data_oracle" {
  name        = "private_data_oracle_sg"
  description = "Allow local traffic for private data resources"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "private-data-oracle-sg"
  }
}

# SG Rule: Allow Oracle Inbound only from Private App SG
resource "aws_vpc_security_group_ingress_rule" "allow_inbound_oracle_from_private_app_sg" {
  security_group_id            = aws_security_group.private_data_oracle.id
  from_port                    = 1521
  ip_protocol                  = "tcp"
  to_port                      = 1521
  referenced_security_group_id = aws_security_group.private_app.id
}

# # SG Rule: Allow Internal Outbound Traffic for Oracle SG
# resource "aws_vpc_security_group_egress_rule" "allow_internal_outbound_ipv4_oracle" {
#   security_group_id = aws_security_group.private_data_oracle.id
#   cidr_ipv4         = aws_vpc.main.cidr_block
#   ip_protocol       = "tcp"
#   to_port           = 1521
# }

# MSSQL SG
resource "aws_security_group" "private_data_mssql" {
  name        = "private_data_mssql_sg"
  description = "Allow local traffic for private data resources"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "private-data-mssql-sg"
  }
}

# SG Rule: Allow MSSQL Server Inbound only from Private App SG
resource "aws_vpc_security_group_ingress_rule" "allow_inbound_mssql_from_private_app_sg" {
  security_group_id            = aws_security_group.private_data_mssql.id
  from_port                    = 1433
  ip_protocol                  = "tcp"
  to_port                      = 1433
  referenced_security_group_id = aws_security_group.private_app.id
}

# # SG Rule: Allow Internal Outbound Traffic for MSSQL SG
# resource "aws_vpc_security_group_egress_rule" "allow_internal_outbound_ipv4_mssql" {
#   security_group_id = aws_security_group.private_data_mssql.id
#   cidr_ipv4         = aws_vpc.main.cidr_block
#   ip_protocol       = "tcp"
#   to_port           = 1433
# }


# MongoDB SG
resource "aws_security_group" "private_data_mongodb" {
  name        = "private_data_mongodb_sg"
  description = "Allow local traffic for private data resources"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "private-data-mongodb-sg"
  }
}

# SG Rule: Allow MongoDB Inbound only from Private App SG
resource "aws_vpc_security_group_ingress_rule" "allow_inbound_mongodb_from_private_app_sg" {
  security_group_id            = aws_security_group.private_data_mongodb.id
  from_port                    = 27017
  ip_protocol                  = "tcp"
  to_port                      = 27017
  referenced_security_group_id = aws_security_group.private_app.id
}

# # SG Rule: Allow Internal Outbound Traffic for MongDB SG
# resource "aws_vpc_security_group_egress_rule" "allow_internal_outbound_ipv4_mongodb" {
#   security_group_id = aws_security_group.private_data_mongodb.id
#   cidr_ipv4         = aws_vpc.main.cidr_block
#   ip_protocol       = tcp
#   to_port           = 27017
# }