- [Available building blocks](#available-building-blocks)
- [ARM template guidelines ideas](#arm-template-guidelines-ideas)
    - [Template output](#template-output)
    - [The Dont's](#the-donts)
# Available building blocks
- basic
    - [virtualMachines](/basic/Microsoft.Compute/virtualMachines/help.md)
    - [vaults](/basic/Microsoft.KeyVault/vaults/help.md)
    - [networkInterfaces](/basic/Microsoft.Network/networkInterfaces/help.md)
    - [networkSecurityGroups](/basic/Microsoft.Network/networkSecurityGroups/help.md)
        - [securityRules](/basic/Microsoft.Network/networkSecurityGroups/securityRules/help.md)
    - [publicIPAddresses](/basic/Microsoft.Network/publicIPAddresses/help.md)
    - [virtualNetworks](/basic/Microsoft.Network/virtualNetworks/help.md)
        - [subnets](/basic/Microsoft.Network/subnets/help.md)
- tier 1
    - [capsule](./tier1/capsule/help.md)
# ARM template guidelines ideas
## Template output
- Each template should output a full reference to the main objects that deploys. And the second parameter of reference(), should be the same apiVersion used to deploy the object.
  ```json
    "outputs": {
        "result": {
            "type": "object",
            "value": "[reference(parameters('name'), '2016-06-01', 'Full')]"
        }
    }
  ```
- Calling a template output through the use of [reference function](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-template-functions-resource#reference) passing the name of the deployment which generate it (not its resource id), creates an implicit dependency; making unnecessary the use of depends on.
## The Dont's
- Do not try to do multiple deployments of objects other than Microsoft.Resources/deployments on the template you are creating. Only Azure's deployments objects should be deployed more than one time through the use of a copy section. Any structure which needs to be deployed several times could be managed as a new BB on the template that is being created providing the same reusability to others. There's always time later to discard a template because of it's lack of usefulness.
- There's no point on trying to provide multideployment support to caller templates from whitin a child. Trying to parametrize the amount of resources to deploy inside a template steals the logic of handling those resources dependencies from the parent template. There's no practical way of reuse the objects deployed by a template on the parent if the parent is not in charge of handling the copies.
- Although [apiProfile feature](https://docs.microsoft.com/en-us/azure/azure-stack/user/azure-stack-version-profiles) could save from specifying apiVersion on every resource. It seems that profiles are not being actively maintained. There's only one fully working apiProfile to choose from and, for example, the apiVersions that it provides for VM does not support managed disks. You could always override apiProfile with apiVersion when necessary, but still the api will be too outdated if you relay on apiProfile.