variable "name_prefix" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "nic_id" { type = string }
variable "admin_username" { type = string }
variable "ssh_public_key" { type = string }
variable "vm_size" { type = string }
variable "tags" {
  type    = map(string)
  default = {}
}
