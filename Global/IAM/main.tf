terraform {
  backend "s3" {
    bucket         = "global-oreview-terraform-state"
    key            = "IAM/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "global-tf-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

module "group_admin" {
  source = "./admin"
}

