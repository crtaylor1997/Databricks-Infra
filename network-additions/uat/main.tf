data "terraform_remote_state" "hub" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstatechristian001"
    container_name       = "tfstate"
    key                  = "network.tfstate"
    use_azuread_auth     = true
  }
}

data "terraform_remote_state" "uat" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstatechristian001"
    container_name       = "tfstate"
    key                  = "uat.tfstate"
    use_azuread_auth     = true
  }
}

resource "azurerm_virtual_network_peering" "hub_to_uat" {
  name = "peer-hub-to-uat"

  resource_group_name  = data.terraform_remote_state.hub.outputs.hub_resource_group_name
  virtual_network_name = data.terraform_remote_state.hub.outputs.hub_vnet_name

  remote_virtual_network_id = data.terraform_remote_state.uat.outputs.spoke_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "uat_to_hub" {
  name = "peer-uat-to-hub"

  resource_group_name  = data.terraform_remote_state.uat.outputs.spoke_resource_group_name
  virtual_network_name = data.terraform_remote_state.uat.outputs.spoke_vnet_name

  remote_virtual_network_id = data.terraform_remote_state.hub.outputs.hub_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_private_dns_zone_virtual_network_link" "databricks_uat" {
  name = "link-databricks-uat"

  resource_group_name = data.terraform_remote_state.hub.outputs.hub_resource_group_name
  private_dns_zone_name = (
    data.terraform_remote_state.hub.outputs.databricks_private_dns_zone_name
  )

  virtual_network_id = data.terraform_remote_state.uat.outputs.spoke_vnet_id

  registration_enabled = false
}