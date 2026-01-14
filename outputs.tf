output "db_password" {
  value     = local.db_credentials.password
  sensitive = true
}
# test, test, 6, 73.166.82.125/32