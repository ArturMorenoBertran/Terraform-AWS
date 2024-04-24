rovider "aws" {
  region = "eu-west-3"
}

variable "users" {
  description = "IAM user names"
  type        = set(string)
  default     = ["artur", "mike", "jordi"]
}

resource "aws_iam_user" "create_users" {
  for_each = var.users

  name = each.value
}


# Obtain specific user arn's
output "arn_user" {
  value = aws_iam_user.create_users["artur"].arn
}


# Obtain all user arn's
output "arn_all_users" {
  value = [for user in aws_iam_user.create_users : user.arn]
}


# Map user name with arn
output "map_users_arn" {
  value = {for user in aws_iam_user.create_users: user.name => user.arn}
}
