data "archive_file" "lambda" {
  type        = "zip"
  source_file = var.zip_path
  output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "lambda_at_edge" {
  provider         = aws.useast
  function_name    = var.function_name
  handler          = var.handler
  role             = aws_iam_role.iam_for_lambda.arn
  runtime          = var.runtime
  filename         = data.archive_file.lambda.output_path
  source_code_hash = data.archive_file.lambda.output_base64sha256
  publish          = true
}

resource "aws_iam_role" "iam_for_lambda" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Principal = {
          Service = [
            "lambda.amazonaws.com",
            "edgelambda.amazonaws.com",
          ]
        },
        Effect = "Allow",
      },
    ],
  })
}

resource "aws_iam_role_policy" "iam_for_lambda" {
  name = var.iam_role_policy_name
  role = aws_iam_role.iam_for_lambda.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
        ],
        Effect   = "Allow",
        Resource = "arn:aws:logs:*:*:*",
      },
    ],
  })
}
