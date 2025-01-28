targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param dataFactoryName string
param linkedServices array

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: 'East US'
}

resource linkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' = [for linkedService in linkedServices: {
  parent: dataFactory
  name: linkedService.name  // Removed the ${dataFactory.name}/ part
  properties: linkedService.definition.properties
}]
