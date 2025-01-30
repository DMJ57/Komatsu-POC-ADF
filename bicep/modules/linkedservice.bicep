targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param dataFactoryName string
param linkedServices array

param properties object 



resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: 'eastus'
  identity: {
    type: 'SystemAssigned'
  }
  properties:properties
}

resource linkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' = [for linkedService in linkedServices: {
  parent: dataFactory
  name: linkedService.name  // Removed the ${dataFactory.name}/ part
  properties: {
    type: linkedService.definition.properties.type
    typeProperties: linkedService.definition.properties.typeProperties
  }
}]
