module "tags" {
  source = "../../modules/tags"

  environment = "uat"
  owner       = "christian"
  project     = "databricks-poc"

  extra_tags = {
    cost_control = "destroy-after-use"
  }
}

module "spoke_network" {
  source = "../../modules/databricks_spoke_network"

  environment         = "uat"
  location            = "eastus"
  resource_group_name = "rg-databricks-uat"

  vnet_address_space  = ["10.20.0.0/16"]
  public_subnet_cidr  = "10.20.1.0/24"
  private_subnet_cidr = "10.20.2.0/24"

  tags = module.tags.tags
}

resource "azurerm_databricks_workspace" "this" {
  name                        = "dbw-databricks-uat"
  resource_group_name         = module.spoke_network.resource_group_name
  location                    = module.spoke_network.location
  sku                         = "premium"
  managed_resource_group_name = "rg-databricks-managed-uat"

  custom_parameters {
    virtual_network_id = module.spoke_network.vnet_id

    public_subnet_name  = module.spoke_network.public_subnet_name
    private_subnet_name = module.spoke_network.private_subnet_name

    public_subnet_network_security_group_association_id = module.spoke_network.public_nsg_association_id

    private_subnet_network_security_group_association_id = module.spoke_network.private_nsg_association_id

    no_public_ip = true
  }

  tags = module.tags.tags
}

output "tags" {
  value = module.tags.tags
}