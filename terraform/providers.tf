provider "azurerm" {
  features {}

  subscription_id = "<your-subscription-id>"
  client_id       = "<your-service-principal-app-id>"
  client_secret   = "<your-service-principal-password>"
  tenant_id       = "<your-tenant-id>"
}
