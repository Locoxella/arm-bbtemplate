# Microsoft.Networks/virtualNetworks/subnets
- [Microsoft.Networks/virtualNetworks/subnets](#microsoftnetworksvirtualnetworkssubnets)
    - [Parameters](#parameters)
    - [Examples](#examples)
    - [Output](#output)
## Parameters
- **name** string. Name for this resource. Default "[concat(resourceGroup().name, '-subnets')]".
- **addressPrefix** string. Tags for this resources. *Mandatory*.
- **virtualNetworksParentREF** object. Reference to parent virtualNetwork of this subnet. *Mandatory*.
- **rulesSet** array. Rules for [securityGroup](../../networkSecurityGroups/securityRules/help.md#need-security-rules). Default empty.

**virtualNetworksParentREF** the object as returned by reference() should be at least
```json
{
    "resourceId": "virtual-network-name"
}
```
Obtained from the output.result of [virtualNetworks](../help.md) and with azure-cli:
```console
az resource-group test-leon --name test-leon-virtualNetworks-dhpcms2suxook --resource-type virtualNetworks --namespace Microsoft.Network
```
## Examples
azure-cli
```shell
az group deployment create --resource-group 'UWUCHLX000' --template-file ./basic/Microsoft.Network/virtualNetworks/subnets/template.json --parameters virtualNetworksParentREF='{"resourceId": "Microsoft.Network/virtualNetworks/UWUCHLX000VNTZZ"}' addressPrefix='10.1.0.0/24' name='UWUCHLX000SBNZZ' --verbose
```
arm template
```json
{
    "name": "basic-subnet",
    "type": "Microsoft.Resources/deployments",
    "apiVersion": "2016-02-01",
    "tags": "[parameters('tags')]",
    "properties": {
        "mode": "Incremental",
        "templateLink": {
            "uri": "[uri(parameters('_artifactsLocation'), concat('basic/Microsoft.Network/virtualNetworks/subnets/template.json', parameters('_artifactsLocationSasToken')))]",
            "contentVersion": "1.0.0.0"
        },
        "parameters": {
            "name": "[concat(parameters('name'), 'SBNZZ' )]",
            "addressPrefix": "10.1.0.0/24",
            "virtualNetworksParentREF": "[json('{\"resourceId\": \"Microsoft.Network/virtualNetworks/UWUCHLX000VNTZZ\"}')]",
            "ruleSet": ""
        }
    }
}
```
## Output
Subnet object with .resourceId
```json
{
    "apiVersion": "2016-06-01",
    "condition": true,
    "isAction": false,
    "isConditionTrue": true,
    "isTemplateResource": false,
    "properties": {
        "addressPrefix": "10.1.0.0/24",
        "provisioningState": "Succeeded"
    },
    "provisioningOperation": "Read",
    "referenceApiVersion": "2016-06-01",
    "resourceGroupName": "UWUCHLX000",
    "resourceId": "Microsoft.Network/virtualNetworks/UWUCHLX000VNTZZ/subnets/UWUCHLX000SBNZZ",
    "subscriptionId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}
```
