resource "aws_s3_bucket" "first_bucket" {
    bucket = var.bucket_name
    force_destroy = true
}

resource "local_file" "bucketmanagement" {
  filename = "${aws_s3_bucket.first_bucket.bucket}.txt"
  content = <<EOF
  ARN: ${aws_s3_bucket.first_bucket.arn}
  prefix: ${aws_s3_bucket.first_bucket.bucket_domain_name}
  id: ${aws_s3_bucket.first_bucket.id}
  lock: ${aws_s3_bucket.first_bucket.object_lock_enabled}
  EOF
}