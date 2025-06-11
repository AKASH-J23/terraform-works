output "policy_id" {
    value = aws_iam_policy.new_policy.policy_id
}

output "policy_details" {
    value = aws_iam_policy.new_policy.arn
}