// dataFactory.bicep

param dataFactoryName string
param location string = 'East US' // Default to East US if not provided

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: location
}
