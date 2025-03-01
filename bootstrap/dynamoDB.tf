resource "aws_dynamodb_table" "tf_locks" {
  for_each = tomap(var.bootstrap_environment)

  name = "${each.key}_tf_locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  lifecycle {
    prevent_destroy = true
  }

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = each.value.tags
}