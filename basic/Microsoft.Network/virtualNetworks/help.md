# Microsoft.Network/virtualNetworks
- [Microsoft.Network/virtualNetworks](#microsoftnetworkvirtualnetworks)
    - [Examples](#examples)
    - [Output](#output)
## Examples
azure-cli
```shell
az group deployment create --resource-group 'UWUCHLX000' --template-file ./basic/Microsoft.Network/virtualNetworks/template.json --parameters addressPrefixes='["10.0.0.0/16"]' name='UWUCHLX000VNTZZ' tags='{}'
```
## Output
virtualNetwork object with .resourceId
```json
{
    "apiVersion": "2018-02-01",
    "condition": true,
    "isAction": false,
    "isConditionTrue": true,
    "isTemplateResource": false,
    "location": "westus",
    "properties": {
        "addressSpace": {
            "addressPrefixes": [
            "10.0.0.0/16"
            ]
        },
        "enableDdosProtection": false,
        "enableVmProtection": false,
        "provisioningState": "Succeeded",
        "resourceGuid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "subnets": [],
        "virtualNetworkPeerings": []
    },
    "provisioningOperation": "Read",
    "referenceApiVersion": "2018-02-01",
    "resourceGroupName": "UWUCHLX000",
    "resourceId": "Microsoft.Network/virtualNetworks/UWUCHLX000VNTZZ",
    "subscriptionId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "tags": {}
}