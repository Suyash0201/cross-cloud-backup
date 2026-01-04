variable "source_bucket" {
  description = "stark-bucket"
  type        = string
}

variable "azure_conn_str" {
  description = "Azure Storage connection string"
  type        = string
  sensitive   = true
}

variable "azure_container" {
  description = "stark-container"
  type        = string
}

variable "resource_group_name" {
  description = "rg"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "stark-digital"
  type        = string
}

variable "container_name" {
  description = "stark-media"
  type        = string
}