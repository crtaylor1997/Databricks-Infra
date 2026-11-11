output "spoke_vnet_id" {
  description = "Resource ID of the prd spoke VNet."
  value       = module.spoke_network.vnet_id
}

output "spoke_vnet_name" {
  description = "Name of the prd spoke VNet."
  value       = module.spoke_network.vnet_name
}

output "spoke_resource_group_name" {
  description = "Resource group containing the prd spoke VNet."
  value       = module.spoke_network.resource_group_name
}
