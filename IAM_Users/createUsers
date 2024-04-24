provider "aws" {
  region = "eu-west-3"
}

variable "users" {
  description = "IAM user names"
  type        = set(string)
  default     = ["artur", "mike", "jordi"]
}

resource "aws_iam_user" "create_users" {
  for_each = var.users

  name = "user-${each.value}"
}


# Obtain specific user arn's
output "arn_user" {
  value = aws_iam_user.users["artur"].arn
}

# Obtain all user arn's
output "arn_all_users" {
  value = [for user in aws_iam_user.users : user.arn]
}

# Obtain all user names with splat expresion
output "arn_all_user_names" {
  value = aws_iam_user.users[*].name
}

# Map user name with arn
output "arn_all_users" {
  value = [for user in aws_iam_user.users: user.name => user.arn]
}
