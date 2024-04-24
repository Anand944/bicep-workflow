param storageAccountName string = 'storage02'
param location string = 'eastus'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
    
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
