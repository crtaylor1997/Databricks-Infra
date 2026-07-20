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
                 ┌─────────────────────────────┐
                 │ Terraform Remote State      │
                 │ rg-tfstate                  │
                 │ Azure Storage / tfstate     │
                 └──────────────┬──────────────┘
                                │
             ┌──────────────────┼──────────────────────┐
             │                  │                      │
      network.tfstate      dev.tfstate     network-additions-dev.tfstate
             │                  │                      │
     ┌───────▼────────┐  ┌─────▼────────────┐  ┌─────▼──────────────┐
     │ Shared Hub     │  │ Databricks DEV   │  │ Cross-Network      │
     │                │  │ Spoke            │  │ Resources          │
     │ Hub VNet       │  │                  │  │                    │
     │ Shared subnet │  │ Spoke VNet       │  │ Hub → DEV peering  │
     │ PE subnet     │  │ Public subnet    │  │ DEV → Hub peering  │
     │ Private DNS   │  │ Private subnet   │  │ DEV DNS zone link  │
     │ Route table   │  │ NSG associations│  └────────────────────┘
     └───────────────┘  │ Databricks       │
                        │ Workspace         │
                        └───────────────────┘
   
modules/
    tags/
    hub_network/
    databricks_spoke_network/
    databricks_workspace/

network/
    backend.hcl
    main.tf
    outputs.tf
    providers.tf

databricks/
    dev/
        main.tf
        outputs.tf
        providers.tf
    uat/
    prd/

network-additions/
    dev/
        backend.hcl
        main.tf
        outputs.tf
        providers.tf

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

GitHub Actions will provide:

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

Completed

- Terraform remote state in Azure Storage
- Standardized resource tagging
- Shared hub VNet
- Shared-services subnet
- Private-endpoints subnet
- Shared-services route table
- Azure Databricks Private DNS zone
- Databricks dev spoke VNet
- VNet-injected Azure Databricks workspace
- Hub-to-dev VNet peering
- Dev-to-hub VNet peering
- Private DNS link to the dev spoke
- Independent Terraform state files

Next

- Github validation and plan pipelines
- Databricks workspace module refactor
- Github actions apply stages and approvals
- Private Endpoint architecture
- Azure Key Vault integration
- Databricks provider configuration
- Unity Catalog
- Databricks Asset Bundles
- UAT and production deployments