variable "region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "ap-south-1"
}

variable "source_bucket" {
  description = "Name of the source S3 bucket"
  type        = string
  default     = "strak-digital"
}

variable "azure_secret_name" {
  description = "Name of the AWS Secrets Manager secret holding the Azure Storage connection string"
  type        = string
  default     = "azure-conn-str"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "strak-group"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "Central India"
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
  default     = "strak-backup"
}

variable "container_name" {
  description = "Name of the Azure Blob container"
  type        = string
  default     = "strak-container"
}
