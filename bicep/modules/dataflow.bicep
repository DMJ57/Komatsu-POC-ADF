param dataFactoryName string
param dataflows array

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: 'East US'
} // Reference to the Data Factory resource

resource dataflow 'Microsoft.DataFactory/factories/dataflows@2018-06-01' = [for dataflow in dataflows: {
  parent: dataFactory // Pass the full resource reference
  name: dataflow.name
  properties: dataflow.definition.properties
}]
