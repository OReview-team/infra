variable "secretsManager_names" {
  type = set(string)
  default = ["front", "back"]

  description = "secrets manager name list for terraform state"
}

# TODO: 추후 상용환경 올릴때 "Prod" 추가
variable "secretsManager_environment" {
  type        = set(string)
  default     = ["dev"]

  description = "secrets manager Environment type of service"
}