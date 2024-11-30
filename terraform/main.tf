provider "aws" {
  region = "us-east-1"  # Set the AWS region
}

resource "aws_iam_role" "lambda_role" {
  name = "my-lambda-role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "my_lambda" {
  function_name = "my-python-lambda"

  s3_bucket = "test-s3-bucket-name"  
  s3_key    = "./app.zip"      

  handler = "main.lambda_handler" 
  runtime = "python3.8"           
  
  role = aws_iam_role.lambda_role.arn  

  environment {
    variables = {
      ENV_VAR_NAME = "value" 
    }
  }
}

