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