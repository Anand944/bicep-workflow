param location string = 'eastus'
param AppserviceplanName string = 'testappservr02'
param sku string = 'F1'
param webappName string = 'testweb08'
param windowsFxVersion string = 'DOTNETCORE|6.0'
param size string = 'F1'
param tier string = 'Free'

resource Appserviceplan 'Microsoft.Web/serverfarms@2022-09-01'={
  location: location 
  name: AppserviceplanName
  properties:{
    reserved: true
  }
  kind: 'windows'
  sku: {
    name: sku
    size: size
    tier: tier
  }
}

resource webapps 'Microsoft.Web/sites@2022-09-01'={
  location: location
  name: webappName
  properties:{
    serverFarmId: Appserviceplan.id
    siteConfig: {
      windowsFxVersion: windowsFxVersion
    }
    clientCertEnabled:false
    httpsOnly:true

  }

}

