variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "name_prefix" {
  description = "Prefix for the storage account name; the environment is appended (max 24 chars total, lowercase alphanumerics)."
  type        = string
  default     = "stdbxchristian"
}

variable "containers" {
  description = "ADLS Gen2 containers (filesystems) to create."
  type        = list(string)
  default     = ["raw", "curated"]
}

variable "tags" {
  type    = map(string)
  default = {}
}
