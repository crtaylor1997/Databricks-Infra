module "tags" {
  source = "../modules/tags"

  environment = "shared"
  owner       = "christian"
  project     = "databricks-poc"

  extra_tags = {
    cost_control = "destroy-after-use"
  }
}

module "hub_network" {
  source = "../modules/hub_network"

  environment                   = "shared"
  location                      = "eastus"
  resource_group_name           = "rg-network-shared"
  vnet_address_space            = ["10.0.0.0/16"]
  shared_services_subnet_cidr   = "10.0.1.0/24"
  private_endpoints_subnet_cidr = "10.0.2.0/24"

  tags = module.tags.tags
}