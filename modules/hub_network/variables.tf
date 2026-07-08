variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "shared_services_subnet_cidr" {
  type = string
}

variable "private_endpoints_subnet_cidr" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}