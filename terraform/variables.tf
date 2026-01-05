variable "source_bucket" {
  description = "strak-digital"
  type        = string
}

# Instead of storing the connection string, store the secret name
variable "azure_secret_name" {
  description = "azure-conn-str"
  type        = string
}

variable "resource_group_name" {
  description = "strak-group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "Central India"
}

variable "storage_account_name" {
  description = "strak-backup"
  type        = string
}

variable "container_name" {
  description = "strak-container"
  type        = string
}
