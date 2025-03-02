locals {
  bucket_infos = {
    for info in setproduct(var.S3_environment, var.S3_bucket_names) :
      "${info[0]}-${info[1]}" => {
        bucketName = "${info[0]}-${info[1]}"
        tags = info[0] == "prod" ? { Environment = "prod" } : { Environment = "dev" }
        versioningStatus = info[0] == "prod" ? "Enabled" : "Suspended"
      }
  }
}

resource "aws_s3_bucket" "OR_bucket" {
  for_each = local.bucket_infos

  bucket = each.value["bucketName"]
  tags = each.value["tags"]
}

resource "aws_s3_bucket_versioning" "OR_bucket_versioning" {
  for_each = local.bucket_infos

  bucket = aws_s3_bucket.OR_bucket[each.key].id

  versioning_configuration {
    status = each.value["versioningStatus"]
  }

  depends_on = [
    aws_s3_bucket.OR_bucket
  ]
}

resource "aws_s3_bucket_public_access_block" "OR_bucket_public_access" {
  for_each = local.bucket_infos

  bucket = aws_s3_bucket.OR_bucket[each.key].id
  block_public_acls = false
  block_public_policy = false

  depends_on = [
    aws_s3_bucket.OR_bucket
  ]
}

resource "aws_s3_bucket_cors_configuration" "OR_bucket_cors" {
  for_each = local.bucket_infos

  bucket = aws_s3_bucket.OR_bucket[each.key].id

  cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }

  depends_on = [
    aws_s3_bucket.OR_bucket
  ]
}

