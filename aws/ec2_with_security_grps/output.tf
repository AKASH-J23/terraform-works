output "ec2" {
    value = aws_instance.instance_creation.arn
}

output "aws_security_group" {
    value = aws_security_group.generating_security_group.id
}