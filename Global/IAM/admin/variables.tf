variable "user_list" {
  type        = set(string)
  default     = ["hoon", "jangdu", "eshika"]

  description = "AWS IAM user list in admin group"
}

variable "IAM_path" {
  type = string
  default = "/admin/"
}

variable "membership_name" {
  type = string
  default = "oreview_admin_membership"
}