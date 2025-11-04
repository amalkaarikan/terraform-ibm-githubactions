variable "ibmcloud_api_key" {
  description = "IBM Cloud API Key"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "IBM Cloud region"
  type        = string
  default     = ""global"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "demo-terraform-rg"
}
