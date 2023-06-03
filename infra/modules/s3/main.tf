resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "main" {
  bucket = aws_s3_bucket.main.id
  acl    = "private"
}
