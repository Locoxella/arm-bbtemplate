# Microsoft.KeyVault/vaults
- [Microsoft.KeyVault/vaults](#microsoftkeyvaultvaults)
    - [Parameters](#parameters)
    - [Examples](#examples)
    - [Outputs](#outputs)

## Parameters
## Examples
```json
{
    "name": "basic-keyvault",
    "type": "Microsoft.Resources/deployments",
    "apiVersion": "2016-02-01",
    "properties": {
        "mode": "Incremental",
        "templateLink": {
            "uri": "[uri(parameters('_artifactsLocation'), concat('basic/Microsoft.KeyVault/vaults/template.json', parameters('_artifactsLocationSasToken')))]",
            "contentVersion": "1.0.0.0"
        },
        "parameters": {
            "name": {
                "value": "[concat(parameters('name'), 'AKVZZ')]"
            },
            "tags": {
                "value": "[parameters('tags')]"
            }
        }
    }
}
```
## Outputs
vault object with .resourceId
```json
{
    "apiVersion": "2015-06-01",
    "condition": true,
    "isAction": false,
    "isConditionTrue": true,
    "isTemplateResource": false,
    "location": "uksouth",
    "properties": {
        "accessPolicies": [],
        "enableSoftDelete": true,
        "enabledForDeployment": true,
        "enabledForDiskEncryption": true,
        "enabledForTemplateDeployment": true,
        "provisioningState": "Succeeded",
        "sku": {
            "family": "A",
            "name": "standard"
        },
        "tenantId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "vaultUri": "https://ukschlx000akvzz.vault.azure.net/"
    },
    "provisioningOperation": "Read",
    "referenceApiVersion": "2015-06-01",
    "resourceGroupName": "UKSCHLX000",
    "resourceId": "Microsoft.KeyVault/vaults/UKSCHLX000AKVZZ",
    "subscriptionId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "tags": {}
}
```