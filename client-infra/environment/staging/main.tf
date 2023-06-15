locals {
  environment         = "staging"
  bucket_name         = "${local.environment}-serverless-sample"
  default_root_object = "index.html"
}

variable "aws_account_id" {
  description = "The AWS account ID"
  type        = string
}

module "s3" {
  source      = "../../modules/s3"
  bucket_name = local.bucket_name
}

module "cloudfront" {
  source                       = "../../modules/cloudfront"
  origin_s3_bucket             = local.bucket_name
  bucket_id                    = module.s3.bucket_id
  bucket_domain_name           = module.s3.bucket_domain_name
  default_root_object          = local.default_root_object
  aws_account_id               = var.aws_account_id
}
