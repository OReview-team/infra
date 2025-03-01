variable "bootstrap_environment" {
  type        = map(object({
    versioning_enabled = bool
    tags               = map(string)
  }))

  default     = {
    "dev" = {
      versioning_enabled = false
      tags = {
        Environment = "dev"
      }
    }
    "prod" = {
      versioning_enabled = true
      tags = {
        Environment = "prod"
      }
    }
    "global" = {
        versioning_enabled = true
        tags = {
            Environment = "global"
        }
    }
  }

  description = "S3 & DynamoDB environment type of service"
}