variable "secrets_string" {
  type        = map(string)

  default     = {
    "NODE_ENV" = "",
    "SERVER_PORT" = "",
    "DB_HOST" = "",
    "DB_PORT" = "",
    "DB_USERNAME" = "",
    "DB_PASSWORD" = "",
    "JWT_ACCESS_SECRET" = "",
    "JWT_REFRESH_SECRET" = ""
  }
}