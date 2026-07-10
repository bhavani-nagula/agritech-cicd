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
