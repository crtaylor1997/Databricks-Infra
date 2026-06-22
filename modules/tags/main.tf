variable "environment" {
  type        = string
  description = "Deployment environment, e.g. dev, uat, prd."
}

variable "owner" {
  type        = string
  description = "Owner of the resources."
}

variable "project" {
  type        = string
  description = "Project or workload name."
}

variable "extra_tags" {
  type        = map(string)
  description = "Optional additional tags."
  default     = {}
}

locals {
  base_tags = {
    environment = var.environment
    owner       = var.owner
    project     = var.project
    managed_by  = "terraform"
  }

  tags = merge(local.base_tags, var.extra_tags)
}

output "tags" {
  description = "Standard tags applied to resources."
  value       = local.tags
}