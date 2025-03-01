variable "S3_bucket_names" {
  type = set(string)
  default = []

  description = "S3 bucket name list for terraform state"
}

# TODO: 추후 상용환경 올릴때 "Prod" 추가
variable "S3_environment" {
  type    = set(string)
  default = ["dev"]

  description = "S3 Environment type of service"
}