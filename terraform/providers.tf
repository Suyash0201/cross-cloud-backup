provider "aws" {
  region = var.region
}

provider "azurerm" {
  features {}

  # Use Service Principal authentication instead of Azure CLI
  subscription_id = "<your-subscription-id>"
  client_id       = "<your-service-principal-app-id>"
  client_secret   = "<your-service-principal-password>"
  tenant_id       = "<your-tenant-id>"
}
