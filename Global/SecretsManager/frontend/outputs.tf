output "Dev_OReview_frontend_secret_id" {
  value = aws_secretsmanager_secret.Dev_OReview_frontend.id
}

output "Dev_OReview_frontend_secret_string" {
  value = aws_secretsmanager_secret_version.Dev_frontend_sversion.secret_string
}

output "Prod_OReview_frontend_secret_id" {
  value = aws_secretsmanager_secret.Prod_OReview_frontend.id
}

output "Prod_OReview_frontend_secret_string" {
  value = aws_secretsmanager_secret_version.Prod_frontend_sversion.secret_string
}