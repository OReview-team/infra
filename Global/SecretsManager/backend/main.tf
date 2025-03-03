# Dev
resource "aws_secretsmanager_secret" "Dev_OReview_backend" {
  name = "dev-oreview-backend"
  recovery_window_in_days = 0

  tags = {
    Environment = "Dev"
  }
}

resource "aws_secretsmanager_secret_version" "Dev_backend_sversion" {
  secret_id = aws_secretsmanager_secret.Dev_OReview_backend.id

  secret_string = jsonencode(var.secrets_string)

  depends_on = [
    aws_secretsmanager_secret.Dev_OReview_backend
  ]
}

# Prod
resource "aws_secretsmanager_secret" "Prod_OReview_backend" {
  name = "prod-oreview-backend"
  recovery_window_in_days = 0

  tags = {
    Environment = "Prod"
  }
}

resource "aws_secretsmanager_secret_version" "Prod_backend_sversion" {
  secret_id = aws_secretsmanager_secret.Prod_OReview_backend.id

  secret_string = jsonencode(var.secrets_string)

  depends_on = [
    aws_secretsmanager_secret.Prod_OReview_backend
  ]
}