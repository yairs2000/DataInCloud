########################
# Create aws lambda
########################

resource "aws_iam_role" "iam_for_lambda" {
  name = var.IamRoleName

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

resource "aws_lambda_function" "s3MoveFilesLambda" {
  filename      = var.lambdaFileName
  function_name = var.lambdaFunctionName
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "Transfers3Data::Function::FunctionHandler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256(var.lambdaFileName)

  runtime = "dotnetcore3.1"

  environment {
    variables = {
      for k, v in merge({
      Name = "${var.lambdaFunctionName}"
    }, var.envVariables) : k => lower(v)
    }
  }
}

resource "aws_cloudwatch_log_group" "example" {
  name              = "/aws/lambda/${var.lambdaFunctionName}"
  retention_in_days = 14
}

# See also the following AWS managed policy: AWSLambdaBasicExecutionRole
resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}