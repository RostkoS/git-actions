provider "aws" {
  region = "us-east-1"
}

resource "aws_lambda_function" "python_lambda" {
  function_name = "my-python-lambda"
  
  s3_bucket = "your-s3-bucket-name"  
  s3_key    = "/app.zip"   
  
  handler = "main.lambda_handler"  
  runtime = "python3.8"           
  
  role = "arn:aws:iam::872515281244:role/test-role"
}

