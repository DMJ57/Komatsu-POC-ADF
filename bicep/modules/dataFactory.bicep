param factoryName string
param location string = resourceGroup().location

resource adf 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: factoryName
  location: location
  properties: {
    
    globalParameters: {
      isTrue: {
        type: 'Boolean'
        value: true
      }
      isFalse: {
        type: 'Boolean'
        value: false
      }
      environmentName: {
        type: 'String'
        value: 'Production'
      }
      apiKey: {
        type: 'String'
        value: 'your-api-key-here'
      }
    }
  }
}

output dataFactoryId string = adf.id
