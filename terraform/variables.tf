variable "source_bucket" {
  description = "Name of the existing S3 bucket"
  type        = string
}

variable "azure_conn_str" {
  description = "Azure Storage connection string"
  type        = string
  sensitive   = true
}

variable "azure_container" {
  description = "Azure Blob container name"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Azure Storage Account name"
  type        = string
}

variable "container_name" {
  description = "Azure Blob container name"
  type        = string
}