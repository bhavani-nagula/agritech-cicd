variable "subscription_id" { type = string }
variable "tenant_id" { type = string }
variable "client_id" { type = string }
variable "client_secret" {
  type      = string
  sensitive = true
}

variable "prefix" {
  type    = string
  default = "agritech"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "location" {
  type    = string
  default = "Korea Central"
}

variable "resource_group_name" {
  type    = string
  default = "agritech-rg"
}

variable "vnet_address_space" {
  type    = list(string)
  default = ["10.10.0.0/16"]
}

variable "vm_subnet_prefixes" {
  type    = list(string)
  default = ["10.10.1.0/24"]
}


variable "admin_username" {
  type    = string
  default = "azadmin"
}

variable "ssh_public_key" {
  type = string
}

variable "vm_size" {
  type    = string
  default = "Standard_B2as_v2"
}

variable "tags" {
  type = map(string)
  default = {
    project = "agritech-marketplace"
    owner   = "devops"
  }
}
variable "acr_username" {
  type = string
}

variable "acr_password" {
  type      = string
  sensitive = true
}
