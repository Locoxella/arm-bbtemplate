# README
- [README](#readme)
- [Naming convention](#naming-convention)
    - [Codes for location](#codes-for-location)
    - [Codes for environment](#codes-for-environment)
    - [Codes for component](#codes-for-component)
    - [Codes for project](#codes-for-project)
    - [Example of name](#example-of-name)
- [Available building blocks](#available-building-blocks)
- [ARM template guidelines ideas](#arm-template-guidelines-ideas)
    - [Template output](#template-output)
    - [The Dont's](#the-donts)

# Naming convention
![alt text](/media/test.4.svg "Logo Title Text 1")
## Codes for location
| Location      | Region              | Sub-Region      | Cod |
| ------------- | ------------------- | --------------- | --- |
| United States | East US             | Virginia        | USE |
|               | East US 2           | Virginia        | UE2 |
|               | Central US          | Iowa            | USC |
|               | North Central US    | Illinois        | USN |
|               | South Central US    | Texas           | USS |
|               | West Central US     | West Central US | USW |
|               | West US             | California      | UWU |
|               | West US 2           | West US 2       | UW2 |
| Goverment     | US Gov Non-Regional | Non-Regional    | UGN |
|               | US Gov Virginia     | Virginia        | UGV |
|               | US Gov IOWA         | IOWA            | UGI |
|               | US Gov Arizona      | Arizona         | UGA |
|               | US Gov Texas        | Texas           | UGT |
|               | US DOD East         | East            | UDE |
|               | US DOD Central      | Central         | UDC |
| Canada        | Canada East         | Quebec City     | CAE |
|               | Canada Central      | Toronto         | CAC |
| Brasil        | Brazil South        | Sao Paulo State | BRS |
| Europe        | North Europe        | Ireland         | EUN |
|               | West Europe         | Netherlands     | EUW |
| UK            | UK West             | Cardiff         | UKW |
|               | Uk South            | London          | UKS |
| Germany       | Germany Central     | Frankfurt       | GEC |
|               | Germany Northeast   | Magdeburg       | GEN |
| France        | France Central      | Paris           | FRC |
|               | France South        | Marseille       | FRS |
| Asia Pacific  | Southeast Asia      | Singapore       | APS |
|               | East Asia           | Hong Kong       | APE |
| Australia     | Australia East      | New South Wales | AUE |
|               | Australia Southeast | Victoria        | AUS |
|               | Australia Central 1 | Canberra        | AC1 |
|               | Australia Central 2 | Canberra        | AC2 |
| China         | China East          | Shanghai        | CNE |
|               | China North         | Beijing         | CNN |
| India         | Central India       | Pune            | INC |
|               | West India          | Mumbai          | INW |
|               | South India         | Chennai         | INS |
| Japan         | Japan East          | Tokio           | JPE |
|               | Japan West          | Osaka           | JPW |
| Korea         | Korea Central       | Seul            | KOC |
|               | Korea South         | Busan           | KOS |
## Codes for environment
| Environment | Cod |
| ----------- | --- |
| POC         | C   |
| DEV         | D   |
| QA          | Q   |
| UAT         | U   |
| Perf        | F   |
| Demo        | E   |
| Staging     | X   |
| Prod        | P   |
| Training    | G   |
| DR          | R   |
## Codes for component
| Component                            | Cod |
| ------------------------------------ | --- |
| Resource Group                       | RSG |
| Virtual Network                      | VNT |
| Network Security Group               | NSG |
| VPN Gateway                          | VNG |
| Network Interface                    | NIC |
| Internal Load Balancer               | ILB |
| External Load Balancer               | ELB |
| Azure Application Gateway            | AAG |
| Subcription                          | SUB |
| Global Traffic Manager               | GTM |
| Subnet                               | SBN |
| Public IP                            | PIP |
| Express Route                        | EXP |
| Storage Account                      | STA |
| Azure KeyVault                       | AKV |
| Recovery Services Vault              | RSV |
| Automation Account                   | AAA |
| OMS Workspace                        | OMS |
| Availability Set                     | AVS |
| Linux Virtual Machine                | LVM |
| Windows Virtual Machine              | MVM |
| Azure SQL                            | SQL |
| Azure MySQL                          | MQL |
| Azure PostgreSQL                     | PQL |
| Web App                              | WAP |
| Web API                              | API |
| App Service Plan                     | ASP |
| App Service Environment              | ASE |
| SendGrid service                     | SDG |
| Azure Service Fabric                 | ASF |
| Virtual Machines Scale Set (Windows) | MSS |
| Virtual Machines Scale Set (Linux)   | LSS |
| Azure Kubernetes Service             | AKS |
| Azure Container Service              | ACS |
| Azure Container Registry             | ACR |
| Azure Functions                      | AZF |
| Logic Apps                           | LAP |
| CosmosDB                             | CDB |
| Redis Cache                          | RDC |
| HDInsights                           | HDI |
| Data Lake Analytics                  | DLA |
## Codes for project
| Offer or Project   (Examples) | Cod |
| ----------------------------- | --- |
| Canvas                        | CAN |
| RPAaaS                        | RPA |
| TDR - CaaS                    | TDR |
| DiaaS - CaaS                  | IDS |
| Helix                         | HLX |
| PowerBI                       | PBI |
| Cytegic - CaaS                | CTG |
## Example of name
|                  | Location | Environment | Offer or Project | Component UID | Component | Sequence |
| ---------------- | -------- | ----------- | ---------------- | ------------- | --------- | -------- |
| Example:         | USN      | P           | CAN              | CEA           | MVM       | 01       |
| Number of Chars: | 3        | 1           | 3                | 3             | 3         | 2        |
Reference: [CTP naming convention v1.xlsx](https://share.ey.net/sites/ITMgdServProgm/_layouts/15/WopiFrame2.aspx?sourcedoc=/sites/ITMgdServProgm/Publishing%20Library/Platform/CTP%20naming%20convention%20v1.xlsx&action=default)
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