output "Dev_OReview_backend_secret_id" {
  value = aws_secretsmanager_secret.Dev_OReview_backend.id
}

output "Dev_OReview_backend_secret_string" {
  value = aws_secretsmanager_secret_version.Dev_backend_sversion.secret_string
}

output "Prod_OReview_backend_secret_id" {
  value = aws_secretsmanager_secret.Prod_OReview_backend.id
}

output "Prod_OReview_backend_secret_string" {
  value = aws_secretsmanager_secret_version.Prod_backend_sversion.secret_string
}