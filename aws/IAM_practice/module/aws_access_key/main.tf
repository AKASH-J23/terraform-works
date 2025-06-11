resource "aws_iam_access_key" "access_key_creation" {
    user = var.name
    lifecycle {
        prevent_destroy = true
    }
}

resource "local_file" "secret_key" {
    filename = "${abspath(path.root)}/${var.name}_secret_key.txt"
    sensitive_content = aws_iam_access_key.access_key_creation.secret
}