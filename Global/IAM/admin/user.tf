resource "aws_iam_user" "OR_admin_user" {
  for_each = toset(var.user_list)
  name = "OR_${each.key}"
  path = var.IAM_path

  tags = {
    Role = "Admin"
  }
}