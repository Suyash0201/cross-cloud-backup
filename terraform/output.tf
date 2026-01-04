output "storage_account_name" {
  description = "stark-digital"
  value       = azurerm_storage_account.sa.name
}

output "storage_account_primary_connection_string" {
  description = "Primary connection string for Azure Storage Account"
  value       = azurerm_storage_account.sa.primary_connection_string
  sensitive   = true
}

output "blob_container_name" {
  description = "stark-media"
  value       = azurerm_storage_container.backup.name
}