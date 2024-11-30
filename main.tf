provider "aws" {
  region = "us-east-1"  
}

resource "aws_iam_role" "lambda_role" {
  name               = "lambda-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}

data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions   = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_lambda_function" "python_lambda" {
  function_name = "my-python-lambda"
  role          = aws_iam_role.lambda_role.arn
  handler       = "main.lambda_handler"
  runtime       = "python3.8"

  source_code_hash = filebase64sha256("main.zip")
}

resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "my-lambda-bucket-for-github-actions"
}

resource "aws_s3_object" "lambda_function_zip" {
  bucket = aws_s3_bucket.lambda_bucket.bucket
  key    = "main.zip"
  source = "main.zip" 
}
