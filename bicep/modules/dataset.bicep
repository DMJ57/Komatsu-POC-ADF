targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param dataFactoryName string
param datasets array

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: 'East US'
}


resource dataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' = [for dataset in datasets: {
  parent: dataFactory
  name: dataset.name
  properties: dataset.definition.properties
}]
