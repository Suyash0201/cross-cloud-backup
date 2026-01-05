resource "aws_lambda_function" "s3_to_blob" {
  function_name = "${var.project_name}-s3-to-blob"
  role          = aws_iam_role.lambda_role.arn
  handler       = "handler.handler"
  runtime       = "python3.12"
  timeout       = var.lambda_timeout
  memory_size   = var.lambda_memory_mb
  publish       = true

  filename         = "${path.module}/../lambda/package.zip"
  source_code_hash = filebase64sha256("${path.module}/../lambda/package.zip")

  environment {
    variables = {
      AWS_REGION                 = var.aws_region
      SOURCE_S3_BUCKET           = var.source_s3_bucket
      SOURCE_S3_PREFIX           = var.source_s3_prefix
      AZURE_SECRET_NAME          = var.azure_secret_name
      AZURE_STORAGE_ACCOUNT_NAME = var.azure_storage_account_name
      AZURE_CONTAINER_NAME       = var.azure_container_name
      LOG_LEVEL                  = "INFO"
    }
  }

  depends_on = [aws_cloudwatch_log_group.lambda]
}

resource "aws_lambda_alias" "current" {
  name             = "current"
  function_name    = aws_lambda_function.s3_to_blob.function_name
  function_version = aws_lambda_function.s3_to_blob.version
}

resource "aws_lambda_provisioned_concurrency_config" "pc" {
  function_name                     = aws_lambda_alias.current.function_name
  qualifier                         = aws_lambda_alias.current.name
  provisioned_concurrent_executions = var.lambda_reserved_concurrency
}
