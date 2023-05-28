resource "aws_lambda_function" "main" {
  function_name    = "lambda_at_edge"
  s3_bucket        = "serverless"
  s3_key           = "your-lambda-code-key"
  handler          = "index.handler"
  role             = aws_iam_role.iam_for_lambda.arn
  runtime          = "nodejs18.x"

  publish = true
}

resource "aws_lambda_permission" "main" {
  statement_id  = "AllowExecutionFromCloudFront"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.main.arn
  principal     = "edgelambda.amazonaws.com"
}

resource "aws_cloudfront_distribution" "main" {
  default_cache_behavior {
    lambda_function_association {
      event_type   = "origin-request"
      lambda_arn   = aws_lambda_function.main.qualified_arn
    }
  }

  depends_on = [aws_lambda_function.main, aws_lambda_permission.main]
}
