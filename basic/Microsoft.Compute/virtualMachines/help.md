# Microsoft.Compute/virtualMachines
- [Microsoft.Compute/virtualMachines](#microsoftcomputevirtualmachines)
    - [Parameters](#parameters)
    - [Examples](#examples)
        - [Azure cli](#azure-cli)
        - [Arm Template](#arm-template)
    - [Outputs](#outputs)

## Parameters
- **name** string. Name for this resource. Default "[concat(take(resourceGroup().name, 10), 'MVMZZ')]".
- **tags** string. Tags for this resources. *Mandatory*.
- **_artifactsLocation** string. Base uri of the artifacts
- **_artifactsLocationSasToken** securestring. Parameters for uri of the artifacts.
- **admin** secureObject. username and password this resource: {"username":"*nightswatch*","password":"*nowMyWatchBegins*"}. Default "[json('null')]".
- **networkInterfaceREF** object. Reference to parent virtualNetwork of this subnet. *Mandatory*.
## Examples
### Azure cli
```shell
```
### Arm Template
```json
```
## Outputs
```json
```