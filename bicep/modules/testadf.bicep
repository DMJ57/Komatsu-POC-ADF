targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param dataFactoryName string
param pipelines array

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: 'East US'
}

resource pipelinesResource 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = [for pipeline in pipelines: {
  parent: dataFactory
  name: pipeline.name
  properties: pipeline.definition.properties
}]

