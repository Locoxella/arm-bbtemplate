# Microsoft.Networks/virtualNetworks/subnets
- [Microsoft.Networks/virtualNetworks/subnets](#microsoftnetworksvirtualnetworkssubnets)
    - [Parameters](#parameters)
    - [Examples](#examples)
## Parameters
- **name** string. Name for this resource. Default "[concat(resourceGroup().name, '-subnets')]".
- **_artifactsLocation** string. Base uri of the artifacts. Default empty.
- **_artifactsLocationSasToken** secureString. Parameters for uri of the artifacts. Default empty.
- **addressPrefix** string. Tags for this resources. Mandatory.
- **virtualNetworksParentREF** object. Reference to parent virtualNetwork of this subnet. Mandatory.
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
```console
az group deployment create --resource-group test-bb --name test-bb --template-file ./basic/Microsoft.Network/virtualNetworks/subnets/template.json --parameters @./basic/Microsoft.Network/virtualNetworks/subnets/template.parameters.json --parameters virtualNetworksParentREF='{"resourceId":"test-bb-vnet"}'
```
arm template
```json
{
    "name": "subnet",
    "type": "Microsoft.Resources/deployments",
    "apiVersion": "2016-02-01",
    "tags": "[parameters('tags')]",
    "properties": {
        "mode": "Complete",
        "templateLink": {
            "uri": "[uri(parameters('_artifactsLocation'), concat('basic/Microsoft.Network/virtualNetworks/subnets/template.json', parameters('_artifactsLocationSasToken')))]",
            "contentVersion": "1.0.0.0"
        },
        "parameters": {
            "name": "[concat(parameters('name'), '-subnet' )]",
            "_artifactsLocation": "[parameters('_artifactsLocation')]",
            "_artifactsLocationSasToken": "[parameters('_artifactsLocationSasToken')]",
            "addressPrefix": "",
            "virtualNetworksParentREF": "",
            "ruleSet": ""
        }
    }
}
```