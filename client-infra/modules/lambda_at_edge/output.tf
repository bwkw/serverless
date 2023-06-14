output "lambda_at_edge_qualified_arn" {
  description = "The ARN of the versioned Lambda function"
  value       = aws_lambda_function.lambda_at_edge.qualified_arn
}