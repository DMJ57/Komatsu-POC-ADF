targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param triggers array


resource triggerADF 'Microsoft.DataFactory/factories/triggers@2018-06-01' = [for trigger in triggers: {
  name: trigger.name
  properties: trigger.definition.properties
}]
