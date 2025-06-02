resource "aws_s3_bucket" "imported" {
    bucket = var.bucket_name
}

resource "local_file" "fileManagement" {
    filename = "${aws_s3_bucket.imported.bucket}.txt"
    content = <<EOF
    bucketName: ${aws_s3_bucket.imported.bucket}
    arn: ${aws_s3_bucket.imported.arn}
    details: ${aws_s3_bucket.imported.object_lock_enabled}
    EOF
    depends_on = [ aws_s3_bucket.imported ]
}

resource "aws_s3_object" "reference_s3_obj" {
    bucket = aws_s3_bucket.imported.id
    source = local_file.fileManagement.filename
    key = local_file.fileManagement.filename
}

# Referencing bucket

# data "aws_s3_bucket" "existing" {
#     bucket = var.bucket_name
# }

# resource "local_file" "fileManagement" {
#     filename = "${data.aws_s3_bucket.existing.bucket}.txt"
#     content = <<EOF
#     bucketName: ${data.aws_s3_bucket.existing.bucket}
#     arn: ${data.aws_s3_bucket.existing.arn}
#     details: ${data.aws_s3_bucket.existing.id}
#     EOF
#     depends_on = [ data.aws_s3_bucket.existing ]
# }

# resource "aws_s3_object" "reference_s3_obj" {
#     bucket = data.aws_s3_bucket.existing.id
#     source = local_file.fileManagement.filename
#     key = local_file.fileManagement.filename
# }