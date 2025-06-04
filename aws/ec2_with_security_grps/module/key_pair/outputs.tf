output "private_key_path" {
    value = local_file.private_key.filename
}

output "aws_key_pair_name" {
    value = aws_key_pair.key_pair.key_name
}

output "private_key" {
    value = tls_private_key.my_key.private_key_pem
}