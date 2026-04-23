variable "resource_group_name" {
  description = "The name of the Azure Resource Group where resources will be created"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "aks_name" {
  type    = string
  default = "fk-aks-private-acr"
}

variable "vnet_name" {
  type    = string
  default = "fk-aks-private-acr-vnet"
}

variable "acr_name" {
  type    = string
  default = "fkacrprivate09"
}

variable "acr_sku" {
  type        = string
  description = "ACR SKU. Premium is required for Private Endpoint."
  default     = "Premium"
}

variable "enable_acr_private_endpoint" {
  type        = bool
  description = "Enable Private Endpoint for ACR"
  default     = true
}

variable "enable_private_dns" {
  type        = bool
  description = "Create and link Private DNS zone for ACR Private Endpoint"
  default     = true
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default = {
    project = "foggykitchen-aks"
    example = "09-private-acr-with-private-endpoint"
  }
}
