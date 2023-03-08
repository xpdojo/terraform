# 소스 코드를 압축해서 Lambda에 업로드
# https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file
data "archive_file" "deflate_lambda_function_zip" {
  type        = "zip"
  source_dir  = "function"
  output_path = "function.zip"

  excludes = [
    "test_example.py",
  ]
}

# AWS Lambda
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function
resource "aws_lambda_function" "my_lambda" {
  function_name = "my_lambda_function"
  role          = aws_iam_role.lambda.arn
  handler       = "example.handler"
  filename      = "function.zip"
  runtime       = "python3.9"
  timeout       = 10

  description = "Test Lambda Function"
  tags        = {
    related = "terraform"
    env     = "dev"
    owner   = "markruler"
  }

  # hash 값이 변경되면 소스 코드만 업데이트될 때도 Lambda가 재배포 됨.
  source_code_hash = data.archive_file.deflate_lambda_function_zip.output_base64sha256

  #  environment {
  #    variables = {
  #      ENVIRONMENT_VARIABLE_1 = "value1"
  #      ENVIRONMENT_VARIABLE_2 = "value2"
  #    }
  #  }
}

# Lambda를 실행시킬 Trigger를 설정하기 위해 권한 추가
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission
resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.my_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.my_rule.arn
}

# Lambda 실행 Role 정의
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
resource "aws_iam_role" "lambda" {
  name = "my_lambda_role"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# 람다 실행 Policy를 Role에 추가
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment
resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda.id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Cloud Watch Logs Policy 정의
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy
resource "aws_iam_policy" "function_logging_policy" {
  name   = "function-logging-policy"
  policy = jsonencode({
    "Version"   = "2012-10-17",
    "Statement" = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect   = "Allow",
        Resource = "arn:aws:logs:*:*:*"
      },
    ]
  })
}

# Log 생성 Policy를 Role에 추가
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment
resource "aws_iam_role_policy_attachment" "function_logging_policy" {
  role       = aws_iam_role.lambda.id
  policy_arn = aws_iam_policy.function_logging_policy.arn
}

# 정해진 주기마다 실행되는 Event Rule을 생성
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule
resource "aws_cloudwatch_event_rule" "my_rule" {
  name                = "my_rule"
  description         = "Trigger my_lambda_function every 1 minute"
  # https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html
  schedule_expression = "rate(1 minute)" # 1분마다 실행.
  #schedule_expression = "rate(5 minutes)" # 5분마다 실행. 1분 이상일 때는 복수형
}

# Event Rule에 Lambda를 Target으로 추가
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target
resource "aws_cloudwatch_event_target" "my_target" {
  target_id = "my_lambda_target"
  rule      = aws_cloudwatch_event_rule.my_rule.id
  arn       = aws_lambda_function.my_lambda.arn
}

# Lambda 실행 로그를 Cloud Watch Logs에 저장
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group
resource "aws_cloudwatch_log_group" "function_log_group" {
  name              = "/aws/lambda/${aws_lambda_function.my_lambda.function_name}"
  retention_in_days = 7
  lifecycle {
    prevent_destroy = false
  }
}
