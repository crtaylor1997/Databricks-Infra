$GitHubOwner = "christianriantaylor"
$GitHubRepo  = "Databricks-Infra"
$AppName     = "github-databricks-infra"

$SubscriptionId = az account show --query id -o tsv
$TenantId       = az account show --query tenantId -o tsv

$AppId = az ad app create `
  --display-name $AppName `
  --query appId `
  -o tsv

az ad sp create --id $AppId


$ServicePrincipalObjectId = az ad sp show `
  --id $AppId `
  --query id `
  -o tsv



  az role assignment create `
  --assignee-object-id $ServicePrincipalObjectId `
  --assignee-principal-type ServicePrincipal `
  --role Contributor `
  --scope "/subscriptions/$SubscriptionId"

  $StorageAccountId = az storage account show `
  --resource-group rg-tfstate `
  --name sttfstatechristian001 `
  --query id `
  -o tsv

  az role assignment create `
  --assignee-object-id $ServicePrincipalObjectId `
  --assignee-principal-type ServicePrincipal `
  --role "Storage Blob Data Contributor" `
  --scope $StorageAccountId

  az ad app federated-credential create `
  --id $AppId `
  --parameters github-uat-federation.json

az ad app federated-credential create `
  --id $AppId `
  --parameters github-prd-federation.json

az ad app federated-credential create `
  --id $AppId `
  --parameters github-hub-federation.json

  az ad app federated-credential create `
  --id $AppId `
  --parameters github-dev-federation.json