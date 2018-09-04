# Microsoft.Network/networkSecurityGroups
## Parameters
- **name** string. Name for this resource. Default [concat(resourceGroup().name, '-nsg')]
- **tags** object. Tags for this resources. Mandatory
- **ruleSet** object. Security Rules. Default empty
  ruleSet can be created with [securityRules guide](./securityRules/securityRules#need-security-rules)

## Examples
Arm template
```json
{
    "name": "deploy-nsg",
    "type": "Microsoft.Resources/deployments",
    "apiVersion": "2016-02-01",
    "properties": {
        "mode": "Incremental",
        "templateLink": {
            "uri": "[uri(parameters('_artifactsLocation'), concat('basic/Microsoft.Network/networkSecurityGroups/template.json', parameters('_artifactsLocationSasToken')))]",
            "contentVersion": "1.0.0.0"
        },
        "parameters": {
            "name": {
                "value": "[concat(parameters('name'), 'NSGZZ')]"
            },
            "tags": {
                "value": "[parameters('tags')]"
            },
            "ruleSet": {
                "value": "[parameters('ruleSet')]"
            }
        }
    }
}
```
Azure-cli
```shell
 az group deployment create --resource-group 'UWUCHLX000' --template-file ./basic/Microsoft.Network/networkSecurityGroups/template.json --parameters
name='UWUCHLX000NSGZZ' tags='{}'
```
## Outputs
.result.value with reference() object to Microsoft.Network/networkSecurityGroups
```json
{
    "apiVersion": "2018-02-01",
    "condition": true,
    "isAction": false,
    "isConditionTrue": true,
    "isTemplateResource": false,
    "location": "westus",
    "properties": {
        "defaultSecurityRules": [
            {
                "etag": "W/\"d4806e05-0df2-4356-b15b-75834d38ceb0\"",
                "id": "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/UWUCHLX000/providers/Microsoft.Network/networkSecurityGroups/UWUCHLX000NSGZZ/defaultSecurityRules/AllowVnetInBound",
                "name": "AllowVnetInBound",
                "properties": {
                    "access": "Allow",
                    "description": "Allow inbound traffic from all VMs in VNET",
                    "destinationAddressPrefix": "VirtualNetwork",
                    "destinationAddressPrefixes": [],
                    "destinationPortRange": "*",
                    "destinationPortRanges": [],
                    "direction": "Inbound",
                    "priority": 65000,
                    "protocol": "*",
                    "provisioningState": "Succeeded",
                    "sourceAddressPrefix": "VirtualNetwork",
                    "sourceAddressPrefixes": [],
                    "sourcePortRange": "*",
                    "sourcePortRanges": []
                },
                "resourceGroup": "UWUCHLX000",
                "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
            },
            {
                "etag": "W/\"d4806e05-0df2-4356-b15b-75834d38ceb0\"",
                "id": "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/UWUCHLX000/providers/Microsoft.Network/networkSecurityGroups/UWUCHLX000NSGZZ/defaultSecurityRules/AllowAzureLoadBalancerInBound",
                "name": "AllowAzureLoadBalancerInBound",
                "properties": {
                    "access": "Allow",
                    "description": "Allow inbound traffic from azure load balancer",
                    "destinationAddressPrefix": "*",
                    "destinationAddressPrefixes": [],
                    "destinationPortRange": "*",
                    "destinationPortRanges": [],
                    "direction": "Inbound",
                    "priority": 65001,
                    "protocol": "*",
                    "provisioningState": "Succeeded",
                    "sourceAddressPrefix": "AzureLoadBalancer",
                    "sourceAddressPrefixes": [],
                    "sourcePortRange": "*",
                    "sourcePortRanges": []
                },
                "resourceGroup": "UWUCHLX000",
                "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
            },
            {
                "etag": "W/\"d4806e05-0df2-4356-b15b-75834d38ceb0\"",
                "id": "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/UWUCHLX000/providers/Microsoft.Network/networkSecurityGroups/UWUCHLX000NSGZZ/defaultSecurityRules/DenyAllInBound",
                "name": "DenyAllInBound",
                "properties": {
                    "access": "Deny",
                    "description": "Deny all inbound traffic",
                    "destinationAddressPrefix": "*",
                    "destinationAddressPrefixes": [],
                    "destinationPortRange": "*",
                    "destinationPortRanges": [],
                    "direction": "Inbound",
                    "priority": 65500,
                    "protocol": "*",
                    "provisioningState": "Succeeded",
                    "sourceAddressPrefix": "*",
                    "sourceAddressPrefixes": [],
                    "sourcePortRange": "*",
                    "sourcePortRanges": []
                },
                "resourceGroup": "UWUCHLX000",
                "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
            },
            {
                "etag": "W/\"d4806e05-0df2-4356-b15b-75834d38ceb0\"",
                "id": "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/UWUCHLX000/providers/Microsoft.Network/networkSecurityGroups/UWUCHLX000NSGZZ/defaultSecurityRules/AllowVnetOutBound",
                "name": "AllowVnetOutBound",
                "properties": {
                    "access": "Allow",
                    "description": "Allow outbound traffic from all VMs to all VMs in VNET",
                    "destinationAddressPrefix": "VirtualNetwork",
                    "destinationAddressPrefixes": [],
                    "destinationPortRange": "*",
                    "destinationPortRanges": [],
                    "direction": "Outbound",
                    "priority": 65000,
                    "protocol": "*",
                    "provisioningState": "Succeeded",
                    "sourceAddressPrefix": "VirtualNetwork",
                    "sourceAddressPrefixes": [],
                    "sourcePortRange": "*",
                    "sourcePortRanges": []
                },
                "resourceGroup": "UWUCHLX000",
                "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
            },
            {
                "etag": "W/\"d4806e05-0df2-4356-b15b-75834d38ceb0\"",
                "id": "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/UWUCHLX000/providers/Microsoft.Network/networkSecurityGroups/UWUCHLX000NSGZZ/defaultSecurityRules/AllowInternetOutBound",
                "name": "AllowInternetOutBound",
                "properties": {
                    "access": "Allow",
                    "description": "Allow outbound traffic from all VMs to Internet",
                    "destinationAddressPrefix": "Internet",
                    "destinationAddressPrefixes": [],
                    "destinationPortRange": "*",
                    "destinationPortRanges": [],
                    "direction": "Outbound",
                    "priority": 65001,
                    "protocol": "*",
                    "provisioningState": "Succeeded",
                    "sourceAddressPrefix": "*",
                    "sourceAddressPrefixes": [],
                    "sourcePortRange": "*",
                    "sourcePortRanges": []
                },
                "resourceGroup": "UWUCHLX000",
                "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
            },
            {
                "etag": "W/\"d4806e05-0df2-4356-b15b-75834d38ceb0\"",
                "id": "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/UWUCHLX000/providers/Microsoft.Network/networkSecurityGroups/UWUCHLX000NSGZZ/defaultSecurityRules/DenyAllOutBound",
                "name": "DenyAllOutBound",
                "properties": {
                    "access": "Deny",
                    "description": "Deny all outbound traffic",
                    "destinationAddressPrefix": "*",
                    "destinationAddressPrefixes": [],
                    "destinationPortRange": "*",
                    "destinationPortRanges": [],
                    "direction": "Outbound",
                    "priority": 65500,
                    "protocol": "*",
                    "provisioningState": "Succeeded",
                    "sourceAddressPrefix": "*",
                    "sourceAddressPrefixes": [],
                    "sourcePortRange": "*",
                    "sourcePortRanges": []
                },
                "resourceGroup": "UWUCHLX000",
                "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
            }
        ],
        "provisioningState": "Succeeded",
        "resourceGuid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "securityRules": []
    },
    "provisioningOperation": "Read",
    "referenceApiVersion": "2018-02-01",
    "resourceGroupName": "UWUCHLX000",
    "resourceId": "Microsoft.Network/networkSecurityGroups/UWUCHLX000NSGZZ",
    "subscriptionId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "tags": {}
}
```