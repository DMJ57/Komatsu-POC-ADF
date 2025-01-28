targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param dataFactoryName string

param properties object 


resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: 'eastus'
  identity: {
    type: 'SystemAssigned'
  }
  properties:properties
}

