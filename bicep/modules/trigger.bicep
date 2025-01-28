targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param triggers array

param dataFactoryName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: 'East US'
}

resource triggerADF 'Microsoft.DataFactory/factories/triggers@2018-06-01' = [for trigger in triggers: {
  name: trigger.name
  parent: dataFactory
  properties: trigger.definition.properties
}]
