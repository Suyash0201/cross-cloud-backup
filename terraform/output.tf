# Outputs for AWS + Azure backup integration

output "lambda_function_name" {
  description = "Name of the AWS Lambda function performing the S3 to Azure backup"
  value       = aws_lambda_function.s3_to_azure.function_name
}

output "lambda_function_arn" {
  description = "ARN of the AWS Lambda function"
  value       = aws_lambda_function.s3_to_azure.arn
}

output "eventbridge_rule_name" {
  description = "Name of the EventBridge rule that triggers the Lambda"
  value       = aws_cloudwatch_event_rule.backup_schedule.name
}

output "source_bucket" {
  description = "Name of the source S3 bucket"
  value       = var.source_bucket
}

output "azure_secret_name" {
  description = "Name of the AWS Secrets Manager secret holding the Azure Storage connection string"
  value       = var.azure_secret_name
}

output "azure_container_name" {
  description = "Name of the Azure Blob container"
  value       = var.container_name
}

output "azure_storage_account_name" {
  description = "Name of the Azure Storage Account"
  value       = var.storage_account_name
}
