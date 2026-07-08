output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "vnet_name" {
  value = azurerm_virtual_network.this.name
}

output "shared_services_subnet_id" {
  value = azurerm_subnet.shared_services.id
}

output "private_endpoints_subnet_id" {
  value = azurerm_subnet.private_endpoints.id
}