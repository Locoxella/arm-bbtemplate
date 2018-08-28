# Microsoft.Network/networkSecurityGroups
## Parameters
- **name** string. Name for this resource. Default [concat(resourceGroup().name, '-nsg')]
- **_artifactsLocation** string. Base uri of the artifacts- Default empty
- **_artifactsLocationSasToken** string. Parameters for uri of the artifacts. Default empty
- **tags** object. Tags for this resources. Mandatory
- **ruleSet** object. Security Rules. Default empty

ruleSet can be created with [securityRules guide](./securityRules/securityRules#need-security-rules)