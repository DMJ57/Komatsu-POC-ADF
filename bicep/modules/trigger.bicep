targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param triggers array

param dataFactoryName string

param properties object 



resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: 'eastus'
  identity: {
    type: 'SystemAssigned'
  }
  properties:properties
}

resource triggerADF 'Microsoft.DataFactory/factories/triggers@2018-06-01' = [for trigger in triggers: {
  name: trigger.name
  parent: dataFactory
  properties: trigger.definition.properties
}]
