output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "vnet_name" {
  value = azurerm_virtual_network.this.name
}

output "public_subnet_name" {
  value = azurerm_subnet.public.name
}

output "private_subnet_name" {
  value = azurerm_subnet.private.name
}

output "public_subnet_id" {
  value = azurerm_subnet.public.id
}

output "private_subnet_id" {
  value = azurerm_subnet.private.id
}

output "public_subnet_nsg_association_id" {
  value = azurerm_subnet_network_security_group_association.public.id
}

output "private_subnet_nsg_association_id" {
  value = azurerm_subnet_network_security_group_association.private.id
}

output "location" {
  value = azurerm_resource_group.this.location
}

output "public_nsg_association_id" {
  value = azurerm_subnet_network_security_group_association.public.id
}

output "private_nsg_association_id" {
  value = azurerm_subnet_network_security_group_association.private.id
}
