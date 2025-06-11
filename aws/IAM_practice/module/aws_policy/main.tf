resource "aws_iam_policy" "new_policy" {
    name = var.name
    description = var.description
    policy = jsonencode(var.policy)
}