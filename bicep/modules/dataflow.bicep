param dataFactoryName string
param dataflows array

param properties object 



resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: 'eastus'
  identity: {
    type: 'SystemAssigned'
  }
  properties:properties
}

resource dataflow 'Microsoft.DataFactory/factories/dataflows@2018-06-01' = [for dataflow in dataflows: {
  parent: dataFactory // Pass the full resource reference
  name: dataflow.name
  properties: dataflow.definition.properties
}]
