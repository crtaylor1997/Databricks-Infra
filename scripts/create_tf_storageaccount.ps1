
az storage account create `
  --name sttfstatechristian001 `
  --resource-group rg-tfstate `
  --location eastus `
  --sku Standard_LRS `
  --kind StorageV2 `
  --allow-blob-public-access false

  