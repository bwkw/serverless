variable "origin_s3_bucket" {
  description = "The name of the S3 bucket from which to serve content"
  type        = string
}

variable "bucket_id" {
  description = "The ID of the S3 bucket"
  type        = string
}

variable "bucket_domain_name" {
  description = "The domain name of the S3 bucket"
  type        = string
}

variable "default_root_object" {
  description = "Object that CloudFront return when requests the root URL"
  type        = string
  default     = "index.html"
}

variable "aws_account_id" {
  description = "The AWS account ID"
  type        = string
}
