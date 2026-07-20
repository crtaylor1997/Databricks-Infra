output "hub_resource_group_name" {
  value = module.hub_network.resource_group_name
}

output "hub_vnet_id" {
  value = module.hub_network.vnet_id
}

output "hub_vnet_name" {
  value = module.hub_network.vnet_name
}

output "hub_shared_services_subnet_id" {
  value = module.hub_network.shared_services_subnet_id
}

output "hub_private_endpoints_subnet_id" {
  value = module.hub_network.private_endpoints_subnet_id
}

output "databricks_private_dns_zone_id" {
  value = module.hub_network.databricks_private_dns_zone_id
}

output "databricks_private_dns_zone_name" {
  value = module.hub_network.databricks_private_dns_zone_name
}

output "hub_shared_services_route_table_id" {
  value = module.hub_network.shared_services_route_table_id
}