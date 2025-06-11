output "aws_iam_user" {
    value = aws_iam_user.new_user.name
}

output "id" {
  value = aws_iam_user.new_user.id
}