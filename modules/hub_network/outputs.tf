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

output "databricks_private_dns_zone_id" {
  description = "Resource ID of the Azure Databricks Private DNS zone."
  value       = azurerm_private_dns_zone.databricks.id
}

output "databricks_private_dns_zone_name" {
  description = "Name of the Azure Databricks Private DNS zone."
  value       = azurerm_private_dns_zone.databricks.name
}

output "shared_services_route_table_id" {
  description = "Resource ID of the shared-services route table."
  value       = azurerm_route_table.shared_services.id
}