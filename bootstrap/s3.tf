resource "aws_s3_bucket" "tf_state_bucket" {
  for_each = tomap(var.bootstrap_environment)

  bucket = "${each.key}-oreview-terraform-state"

  lifecycle {
    prevent_destroy = true
  }

  tags = each.value.tags
}

resource "aws_s3_bucket_versioning" "tf_state_bucket_versioning" {
  for_each = tomap(var.bootstrap_environment)

  bucket = aws_s3_bucket.tf_state_bucket[each.key].id

  versioning_configuration {
    status = each.value.versioning_enabled ? "Enabled" : "Suspended"
  }
}