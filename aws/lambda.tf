data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/../../lambda"
  output_path = "${path.module}/../../lambda/backup.zip"
}

resource "aws_lambda_function" "s3_to_azure" {
  function_name = "s3-to-azure-backup"
  role          = aws_iam_role.lambda_role.arn
  handler       = "backup.lambda_handler"
  runtime       = "python3.9"

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  timeout     = 300
  memory_size = 512

  environment {
    variables = {
      SOURCE_BUCKET   = var.source_bucket
      AZURE_CONTAINER = var.container_name
      SECRET_NAME     = var.azure_secret_name
    }
  }

  tags = {
    environment = "dev"
    owner       = "suyash"
  }
}
