output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = var.bucket_name
}

output "bucket_id" {
  description = "The name of the bucket"
  value       = aws_s3_bucket.main.id
}

output "bucket_domain_name" {
  description = "The domain name of the bucket"
  value       = aws_s3_bucket.main.bucket_domain_name
}
