provider "aws" {
  region = var.region
}

provider "azurerm" {
  features {}

  # If you want to use Azure CLI authentication:
  # Make sure Azure CLI is installed and run `az login`

  # Or uncomment and fill in Service Principal details:
  # subscription_id = "<your-subscription-id>"
  # client_id       = "<your-service-principal-app-id>"
  # client_secret   = "<your-service-principal-password>"
  # tenant_id       = "<your-tenant-id>"
}
