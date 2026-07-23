output "hub_to_uat_peering_id" {
  description = "Resource ID of the hub-to-uat VNet peering."
  value       = azurerm_virtual_network_peering.hub_to_uat.id
}

output "uat_to_hub_peering_id" {
  description = "Resource ID of the uat-to-hub VNet peering."
  value       = azurerm_virtual_network_peering.uat_to_hub.id
}

output "databricks_uat_dns_link_id" {
  description = "Resource ID of the Databricks private DNS link to uat."
  value       = azurerm_private_dns_zone_virtual_network_link.databricks_uat.id
}