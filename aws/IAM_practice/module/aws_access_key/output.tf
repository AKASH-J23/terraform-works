output "access_key" {
  value = aws_iam_access_key.access_key_creation.key_fingerprint
  sensitive = true
}