variable "secrets_string" {
  type        = map(string)

  default     = {
    "POSTGRES_USERNAME" = "",
    "POSTGRES_PASSWORD" = ""
  }
}