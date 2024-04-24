param location string = 'eastus'
param AppserviceplanName string = 'testappservr02'
param sku string = 'F1'
param webappName string = 'testweb08'
param linuxFxVersion string = 'node|14-lts'

resource Appserviceplan 'Microsoft.Web/serverfarms@2022-09-01'={
  location: location 
  name: AppserviceplanName
  properties:{
    reserved: true
  }
  kind: 'linux'
  sku: {
    name: sku
  }
}

resource webapps 'Microsoft.Web/sites@2022-09-01'={
  location: location
  name: webappName
  properties:{
    serverFarmId: Appserviceplan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
    clientCertEnabled:false
    httpsOnly:true

  }

}

