terraform {
  backend "s3" {
    bucket = "global-oreview-terraform-state"
    key    = "secretsManager/terraform.tfstate"
    region = "ap-northeast-2"
    dynamodb_table = "global-tf-locks"
    encrypt = true
  }
}

locals {
  secretsManager_infos = {
    for info in setproduct(var.secretsManager_environment, var.secretsManager_names) :
    "${info[0]}-${info[1]}" => {
      secretsManagerName = "${info[0]}-oreview-${info[1]}" # ex) prod-oreview-front
      tags = info[0] == "prod" ? { Environment = "prod" } : { Environment = "dev" }
    }
  }
}

resource "aws_secretsmanager_secret" "OR_secret_manager" {}