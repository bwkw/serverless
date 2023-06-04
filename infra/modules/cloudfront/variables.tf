variable "origin_s3_bucket" {
  description = "The name of the S3 bucket from which to serve content"
  type        = string
}

variable "default_root_object" {
  description = "Object that CloudFront return when requests the root URL"
  type        = string
  default     = "index.html"
}

variable "lambda_at_edge_qualified_arn" {
  description = "The ARN of the Lambda@Edge function with version"
  type        = string
}
