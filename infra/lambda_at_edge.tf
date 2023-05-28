resource "aws_lambda_function" "lambda_at_edge" {
  function_name    = "lambda_at_edge"
  s3_bucket        = "your-lambda-code-bucket"
  s3_key           = "your-lambda-code-key"
  handler          = "index.handler"
  role             = aws_iam_role.iam_for_lambda.arn
  runtime          = "nodejs12.x"

  publish = true
}

resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "AllowExecutionFromCloudFront"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_at_edge.arn
  principal     = "edgelambda.amazonaws.com"
}

resource "aws_cloudfront_distribution" "cloudfront_distribution" {
  default_cache_behavior {
    lambda_function_association {
      event_type   = "origin-request"
      lambda_arn   = aws_lambda_function.lambda_at_edge.qualified_arn
    }
  }

  depends_on = [aws_lambda_function.lambda_at_edge, aws_lambda_permission.lambda_permission]
}

