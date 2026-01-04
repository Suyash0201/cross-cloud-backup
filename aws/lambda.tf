resource "aws_lambda_function" "s3_to_azure" {
  function_name = "s3-to-azure-backup"
  role          = aws_iam_role.lambda_role.arn
  handler       = "backup.lambda_handler"
  runtime       = "python3.9"

  filename      = "${path.module}/../../lambda/backup.zip"

  environment {
    variables = {
      SOURCE_BUCKET   = var.source_bucket
      AZURE_CONN_STR  = var.azure_conn_str
      AZURE_CONTAINER = var.azure_container
    }
  }
}