variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "existing_s3_bucket_name" {
  type        = string
  description = "Name of the source S3 bucket" 
}

variable "azure_location" {
  type    = string
  default = "East US"
}

variable "resource_group_name" {
  type    = string
  default = "rg-backup-sync"
}