terraform {
  backend "s3" {
    bucket         = "global-oreview-terraform-state"
    key            = "secrets-manager/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "global_tf_locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-northeast-2" // Asia - Seoul region
}

module "secrets_database" {
  source = "./database"
}

module "secrets_backend" {
  source = "./backend"
}

module "secrets_frontend" {
  source = "./frontend"
}