targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param dataFactoryName string

param properties object 
param linkedServices array
param datasets array
param dataflows array
param pipelines array
param triggers array


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

resource dataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' = [for dataset in datasets: {
  parent: dataFactory
  name: dataset.name
  properties: dataset.definition.properties
}]

resource dataflow 'Microsoft.DataFactory/factories/dataflows@2018-06-01' = [for dataflow in dataflows: {
  parent: dataFactory // Pass the full resource reference
  name: dataflow.name
  properties: dataflow.definition.properties
}]

resource pipelinesResource 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = [for pipeline in pipelines: {
  parent: dataFactory
  name: pipeline.name
  properties: pipeline.definition.properties
}]

resource triggerADF 'Microsoft.DataFactory/factories/triggers@2018-06-01' = [for trigger in triggers: {
  name: trigger.name
  parent: dataFactory
  properties: trigger.definition.properties
}]
