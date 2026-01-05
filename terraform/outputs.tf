output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = aws_lambda_function.s3_to_blob.function_name
}

output "eventbridge_rule_arn" {
  description = "ARN of the EventBridge rule"
  value       = aws_cloudwatch_event_rule.every_4_hours.arn
}

output "azure_storage_account_name" {
  description = "Azure storage account name"
  value       = azurerm_storage_account.backup_sa.name
}

output "azure_container_name" {
  description = "Azure storage container name"
  value       = azurerm_storage_container.backup_container.name
}
