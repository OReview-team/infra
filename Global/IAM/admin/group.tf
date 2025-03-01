resource "aws_iam_group" "oreview_admin" {
  name = "oreview_admin"
  path = var.IAM_path
}

resource "aws_iam_group_policy_attachment" "admin_policy_attachment" {
  group      = aws_iam_group.oreview_admin.name
  policy_arn = data.aws_iam_policy.admin_policy.arn
}

resource "aws_iam_group_membership" "oreview_admin_membership" {
  group = aws_iam_group.oreview_admin.name
  name  = var.membership_name

  users = [
    for user in aws_iam_user.OR_admin_user : user.name
  ]

  depends_on = [
    aws_iam_user.OR_admin_user,
    data.aws_iam_policy.admin_policy,
    aws_iam_group.oreview_admin,
    aws_iam_group_policy_attachment.admin_policy_attachment
  ]
}