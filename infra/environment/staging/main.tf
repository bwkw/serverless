locals {
  bucket_name = "serverless"
  default_root_object = "index.html"
}

module "s3" {
  source = "../../modules/s3"
  
  bucket_name = local.bucket_name
}

module "cloudfront" {
  source = "../../modules/cloudfront"
  
  origin_s3_bucket = local.bucket_name
  default_root_object = local.default_root_object
}
