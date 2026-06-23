module "tags" {
  source = "../../modules/tags"

  environment = "dev"
  owner       = "christian"
  project     = "databricks-poc"

  extra_tags = {
    cost_control = "destroy-after-use"
  }
}

output "tags" {
  value = module.tags.tags
}

module "spoke_network" {
  source = "../../modules/databricks_spoke_network"

  environment         = "dev"
  location            = "eastus"
  resource_group_name = "rg-databricks-dev"
  vnet_address_space  = ["10.10.0.0/16"]
  public_subnet_cidr  = "10.10.1.0/24"
  private_subnet_cidr = "10.10.2.0/24"

  tags = module.tags.tags
}