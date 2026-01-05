variable "source_bucket" {
  description = "Name of the existing AWS S3 bucket"
  type        = string
}

# Instead of storing the connection string, store the secret name
variable "azure_secret_name" {
  description = "Name of the AWS Secrets Manager secret holding the Azure Storage connection string"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "Central India"
}

variable "storage_account_name" {
  description = "Azure Storage Account name"
  type        = string
}

variable "container_name" {
  description = "Name of the Azure Blob container"
  type        = string
}
