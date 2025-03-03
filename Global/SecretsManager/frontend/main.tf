# Dev
resource "aws_secretsmanager_secret" "Dev_OReview_frontend" {
  name = "dev-oreview-frontend"
  recovery_window_in_days = 0

  tags = {
    Environment = "Dev"
  }
}

resource "aws_secretsmanager_secret_version" "Dev_frontend_sversion" {
  secret_id = aws_secretsmanager_secret.Dev_OReview_frontend.id

  secret_string = jsonencode(var.secrets_string)

  depends_on = [
    aws_secretsmanager_secret.Dev_OReview_frontend
  ]
}

# Prod
resource "aws_secretsmanager_secret" "Prod_OReview_frontend" {
  name = "prod-oreview-frontend"
  recovery_window_in_days = 0

  tags = {
    Environment = "Prod"
  }
}

resource "aws_secretsmanager_secret_version" "Prod_frontend_sversion" {
  secret_id = aws_secretsmanager_secret.Prod_OReview_frontend.id

  secret_string = jsonencode(var.secrets_string)

  depends_on = [
    aws_secretsmanager_secret.Prod_OReview_frontend
  ]
}