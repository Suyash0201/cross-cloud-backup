resource "azurerm_resource_group" "backup_rg" {
  name     = var.resource_group_name
  location = var.azure_location
}

resource "azurerm_storage_account" "backup_sa" {
  name                     = "stbackupcrosscloud001"
  resource_group_name      = azurerm_resource_group.backup_rg.name
  location                 = azurerm_resource_group.backup_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  # Ensure private access and encryption at rest 
  public_network_access_enabled = false
  enable_https_traffic_only     = true
  min_tls_version               = "TLS1_2"
}

resource "azurerm_storage_container" "backup_container" {
  name                  = "s3-backups"
  storage_account_name  = azurerm_storage_account.backup_sa.name
  container_access_type = "private" 
}