param server_name string
param system_tag string
@secure()
param sql_admin_login string
@secure()
param sql_admin_password string

param database_name string
param database_sku string
param database_tier string
param database_dtu_capacity int
param database_max_size_bytes int

var tags = {
  System: system_tag
}

resource sqlServer 'Microsoft.Sql/servers@2024-11-01-preview' = {
  name: server_name
  location: resourceGroup().location
  tags: tags
  properties: {
    minimalTlsVersion: '1.2'
    administratorLogin: sql_admin_login
    administratorLoginPassword: sql_admin_password
    administrators: {
      azureADOnlyAuthentication: false
    }
  }
}

resource sqlDatabase 'Microsoft.Sql/servers/databases@2024-11-01-preview' = {
  name: database_name
  parent: sqlServer
  location: resourceGroup().location
  tags: tags
  sku: {
    capacity: database_dtu_capacity
    name: database_sku
    tier: database_tier
  }
  properties: {
    autoPauseDelay: -1
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    createMode: 'Default'
    maxSizeBytes: database_max_size_bytes
    requestedBackupStorageRedundancy: 'Local'
  }
}
