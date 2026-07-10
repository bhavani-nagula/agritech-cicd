output "id" { value = azurerm_network_interface.this.id }
output "private_ip_address" { value = azurerm_network_interface.this.ip_configuration[0].private_ip_address }
