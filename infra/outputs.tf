output "resource_group_name" {
  value = module.resource_group.name
}

output "vm_public_ip" {
  value = module.public_ip.ip_address
}

output "vm_private_ip" {
  value = module.nic.private_ip_address
}

output "storage_account_name" {
  value = module.storage_account.name
}

output "acr_login_server" {
  description = "Azure Container Registry Login Server"
  value       = module.acr.acr_login_server
}

output "acr_admin_username" {
  description = "Azure Container Registry Admin Username"
  value       = module.acr.acr_admin_username
}

output "acr_admin_password" {
  description = "Azure Container Registry Admin Password"
  value       = module.acr.acr_admin_password
  sensitive   = true
}