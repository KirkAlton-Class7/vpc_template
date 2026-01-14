# Secret - Read-DB-Secret
resource "aws_iam_policy" "read_db_secret" {
  name        = "get-db-secret-${local.name_suffix}"
  path        = "/"
  description = "Read specific secret for db."

  policy = aws_iam_policy_document.read_db_secret.json
}

# Policy Document - Read-DB-Secret
data "aws_iam_policy_document" "read_db_secret" {
  statement {
    sid = "ReadDBSecret"
    effect    = "Allow"
    actions   = [
        "secretsmanager:GetSecretValue"
        ]
    resources = [
        aws_secretsmanager_secret.lab_rds_mysql.arn
        ]
  }
}