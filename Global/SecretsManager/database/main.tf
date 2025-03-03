# Dev
resource "aws_secretsmanager_secret" "Dev_database" {
  name = "dev-database"
  recovery_window_in_days = 0

  tags = {
    Environment = "Dev"
  }
}

resource "aws_secretsmanager_secret_version" "Dev_database_sversion" {
  secret_id = aws_secretsmanager_secret.Dev_database.id

  secret_string = jsonencode(var.secrets_string)

  depends_on = [
    aws_secretsmanager_secret.Dev_database
  ]
}

# Prod
resource "aws_secretsmanager_secret" "Prod_database" {
  name = "prod-database"
  recovery_window_in_days = 0

  tags = {
    Environment = "Prod"
  }
}

resource "aws_secretsmanager_secret_version" "Prod_database_sversion" {
  secret_id = aws_secretsmanager_secret.Prod_database.id

  secret_string = jsonencode(var.secrets_string)

  depends_on = [
    aws_secretsmanager_secret.Prod_database
  ]
}