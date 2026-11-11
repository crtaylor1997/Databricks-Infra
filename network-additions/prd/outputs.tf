output "hub_to_prd_peering_id" {
  description = "Resource ID of the hub-to-prd VNet peering."
  value       = azurerm_virtual_network_peering.hub_to_prd.id
}

output "prd_to_hub_peering_id" {
  description = "Resource ID of the prd-to-hub VNet peering."
  value       = azurerm_virtual_network_peering.prd_to_hub.id
}

output "databricks_prd_dns_link_id" {
  description = "Resource ID of the Databricks private DNS link to prd."
  value       = azurerm_private_dns_zone_virtual_network_link.databricks_prd.id
}
