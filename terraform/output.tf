output "azure_storage_account_name" {
  value = azurerm_storage_account.backup_sa.name
}

output "iam_role_arn" {
  value = aws_iam_role.backup_lambda_role.arn
}