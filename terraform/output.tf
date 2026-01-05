output "storage_account_name" {
  description = "Name of the Azure Storage Account"
  value       = azurerm_storage_account.sa.name
}

# Consider removing this if you use Managed Identity or SAS tokens
output "storage_account_primary_connection_string" {
  description = "Primary connection string for Azure Storage Account (sensitive)"
  value       = azurerm_storage_account.sa.primary_connection_string
  sensitive   = true
}

output "container_name" {
  description = "Name of the Azure Blob container"
  value       = azurerm_storage_container.backup.name
}
