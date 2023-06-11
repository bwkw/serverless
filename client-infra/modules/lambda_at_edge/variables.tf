variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "handler" {
  description = "The handler of the Lambda function"
  type        = string
}

variable "runtime" {
  description = "The runtime of the Lambda function"
  type        = string
}

variable "zip_path" {
  description = "The path to the Lambda function zip"
  type        = string
}

variable "iam_role_name" {
  description = "The name of the IAM role for the Lambda function"
  type        = string
}

variable "iam_role_policy_name" {
  description = "The name of the IAM policy for the Lambda function"
  type        = string
}
