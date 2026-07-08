Azure Databricks Infrastructure POC
Overview

This repository is a proof of concept (POC) for deploying and managing Azure Databricks infrastructure using Terraform and Azure DevOps.

The primary goals are to:

Learn enterprise Terraform patterns
Build a reusable Azure Databricks deployment framework
Implement Infrastructure as Code (IaC) using Terraform modules
Implement CI/CD using Azure DevOps Pipelines
Explore Azure networking concepts including Hub-and-Spoke architecture, VNet Injection, Private Link, and Private DNS
Keep all infrastructure disposable to minimize Azure costs
Current Architecture
                     Azure Subscription
                             │
                ┌────────────────────────┐
                │ Terraform State        │
                │ rg-tfstate             │
                │ Storage Account        │
                └──────────┬─────────────┘
                           │
                    Terraform Backend
                           │
        ┌──────────────────┴──────────────────┐
        │                                     │
   Hub Network (planned)             Databricks Spoke
        │                            DEV Environment
        │
   Shared Services

   
Repository Structure
modules/
    tags/
    hub_network/
    databricks_spoke_network/
    databricks_workspace/

network/

databricks/
    dev/
    uat/
    prd/

.azuredevops/
Terraform Modules
tags

Provides standardized tags applied to all Azure resources.

hub_network

Creates shared networking resources including:

Hub VNet
Shared Services subnet
Private Endpoint subnet
(Future)
Azure Firewall
Bastion
Private DNS
Route Tables
databricks_spoke_network

Creates:

Resource Group
Spoke VNet
Databricks Public Subnet
Databricks Private Subnet
Network Security Group
Subnet Associations
databricks_workspace

Creates:

Azure Databricks Workspace
VNet Injection
Workspace configuration
Deployment Strategy

Each deployment is managed by its own Terraform root module and state file.

Root Module	Purpose
network	Shared networking resources
databricks/dev	Development environment
databricks/uat	UAT environment
databricks/prd	Production environment
CI/CD (Planned)

Azure DevOps Pipelines will provide:

Terraform Format Validation
Terraform Validation
Terraform Plan
Terraform Apply
Manual Production Approval
Notebook Deployment
Cluster Configuration Deployment
Job Deployment
Future Enhancements
Hub-and-Spoke Networking
VNet Peering
Azure Firewall
Route Tables
Private Link
Private DNS Zones
Unity Catalog
Cluster Policies
Databricks Asset Bundles
Notebook CI/CD
Compute Configuration CI/CD
Secret Management with Azure Key Vault
Monitoring and Logging
Cost Management

This project is designed to be disposable.

Infrastructure is deployed only for testing and destroyed afterward.

Permanent resources:

Terraform backend resource group
Terraform state storage account
Terraform state container

Temporary resources:

Databricks Workspaces
VNets
Network Security Groups
Private Endpoints
Hub-and-Spoke Networking
Compute Resources