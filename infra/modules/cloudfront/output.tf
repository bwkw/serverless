output "cloudfront_origin_access_identity" {
  description = "The ID of the CloudFront origin access identity"
  value       = aws_cloudfront_origin_access_identity.origin_access_identity.id
}
