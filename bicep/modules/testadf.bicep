targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param pipelines array


resource pipelinesResource 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = [for pipeline in pipelines: {
  name: pipeline.name
  properties: pipeline.definition.properties
}]

