targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param datasets array

resource dataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' = [for dataset in datasets: {
  name: dataset.name
  properties: dataset.definition.properties
}]
