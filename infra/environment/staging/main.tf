locals {
  bucket_name         = "stg-serverless-sample"
  default_root_object = "index.html"

  lambda_function_name = "lambda_at_edge"
  lambda_handler       = "index.handler"
  lambda_runtime       = "nodejs18.x"
  lambda_zip_path      = "../../modules/lambda_at_edge/index.js"
  iam_role_name        = "serverless-lambda_at_edge_role"
  iam_role_policy_name = "serverless-lambda_at_edge_role_policy"
}

module "s3" {
  source      = "../../modules/s3"
  bucket_name = local.bucket_name
}

module "lambda" {
  providers = {
    aws        = aws
    aws.useast = aws.useast
  }
  source               = "../../modules/lambda_at_edge"
  function_name        = local.lambda_function_name
  handler              = local.lambda_handler
  runtime              = local.lambda_runtime
  zip_path             = local.lambda_zip_path
  iam_role_name        = local.iam_role_name
  iam_role_policy_name = local.iam_role_policy_name
}

module "cloudfront" {
  source                       = "../../modules/cloudfront"
  origin_s3_bucket             = local.bucket_name
  bucket_id                    = module.s3.bucket_id
  bucket_domain_name           = module.s3.bucket_domain_name
  default_root_object          = local.default_root_object
  lambda_at_edge_qualified_arn = module.lambda.lambda_at_edge_qualified_arn
}
