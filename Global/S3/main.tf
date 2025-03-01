terraform {
  backend "s3" {
    bucket = "global-oreview-terraform-state"
    key    = "S3/terraform.tfstate"
    region = "ap-northeast-2"
    dynamodb_table = "global-tf-locks"
    encrypt = true
  }
}

provider "aws" {
  region = "ap-northeast-2" // Asia - Seoul region
}
