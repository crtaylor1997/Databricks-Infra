output "hub_to_dev_peering_id" {
  description = "Resource ID of the hub-to-dev VNet peering."
  value       = azurerm_virtual_network_peering.hub_to_dev.id
}

output "dev_to_hub_peering_id" {
  description = "Resource ID of the dev-to-hub VNet peering."
  value       = azurerm_virtual_network_peering.dev_to_hub.id
}

output "databricks_dev_dns_link_id" {
  description = "Resource ID of the Databricks private DNS link to dev."
  value       = azurerm_private_dns_zone_virtual_network_link.databricks_dev.id
}