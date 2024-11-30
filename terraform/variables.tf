variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"  
}

variable "lambda_function_name" {
  description = "Lambda function name"
  type        = string
  default     = "my-python-lambda"  
}

variable "s3_bucket" {
  description = "S3 bucket name for Lambda deployment"
  type        = string
}

variable "s3_key" {
  description = "S3 key for Lambda zip file"
  type        = string
}
