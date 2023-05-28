resource "aws_s3_bucket" "bucket" {
  bucket = "serverless"
  acl    = "private"

  versioning {
    enabled = true
  }
}
