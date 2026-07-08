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

resource "azurerm_databricks_workspace" "this" {
  name                        = "dbw-databricks-dev"
  resource_group_name         = module.spoke_network.resource_group_name
  location                    = module.spoke_network.location
  sku                         = "premium"
  managed_resource_group_name = "rg-databricks-managed-dev"

  custom_parameters {
    virtual_network_id = module.spoke_network.virtual_network_id

    public_subnet_name  = module.spoke_network.public_subnet_name
    private_subnet_name = module.spoke_network.private_subnet_name

    public_subnet_network_security_group_association_id  = module.spoke_network.public_nsg_association_id
    private_subnet_network_security_group_association_id = module.spoke_network.private_nsg_association_id

    no_public_ip = true
  }

  tags = module.tags.tags
}