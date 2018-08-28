# Capsule
- [Capsule](#capsule)
    - [Parameters](#parameters)
## Parameters
- **name** string. Name for this resource. Mandatory.
- **_artifactsLocation** string. Base uri of the artifacts. Default "[uri(deployment().properties.templateLink.uri, '')]".
- **_artifactsLocationSasToken** secureString. Parameters for uri of the artifacts. Default empty.
- **tags** object. Tags for this resources. Mandatory.
- **addressPrefix** string. CIDR address prefix for the subnet of the capsule. Mandatory.
- **virtualNetworksParentREF** object. Object reference to host virtualNetwork for capsule's subnet. Mandatory.

**virtualNetworksParentREF** should be at least
```json
{
    "resourceId": "virtual-network-name"
}