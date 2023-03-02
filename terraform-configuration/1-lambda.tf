locals {
  file_path = "/home/ubuntu/workspace/Lambda/src"
  file_base64sha256 = filesha256("${local.file_path}")
}

resource "aws_lambda_function" "myLambda" {
  function_name = "leumi-function"
  s3_bucket     = aws_s3_bucket.mybucket.id
  s3_key        = "hello.zip"
  handler       = "hello.handler"
  runtime       = "nodejs12.x"
  source_code_hash = local.file_base64sha256
  role          = aws_iam_role.lambda_role.arn
}

resource "aws_iam_role" "lambda_role" {
  name = "role_lambda"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.lambda_role.name
}
