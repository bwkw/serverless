resource "aws_s3_bucket" "main" {
  bucket = "serverless"
  acl    = "private"

  versioning {
    enabled = true
  }
}
