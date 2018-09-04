# Microsoft.Network/networkSecurityGroups
## Need security rules?
You can create the security rules parameter by calling rules.json file. The format of each protocol is:
- __PROTOCOL__*Allow* (HTTPAllow: allow incoming traffic on TCP port 80)

With shell:
```shell
curl https://raw.githubusercontent.com/Locoxella/arm-bbtemplate/master/basic/Microsoft.Network/networkSecurityGroups/securityRules/parameters.rules.json
 | jq -c '[.[] | select(.name | contains("HTTPAllow","RDPAllow", "SSHAllow"))]'
```
Will return security rules to allow incoming HTTP and RDP:
```json
[
    {
        "name": "RDPAllow",
        "properties": {
            "description": "allow RDP connections",
            "direction": "Inbound",
            "sourceAddressPrefix": "[parameters('source')",
            "destinationAddressPrefix": "[parameters('destination')]",
            "sourcePortRange": "*",
            "destinationPortRange": "3389",
            "access": "Allow",
            "protocol": "Tcp"
        }
    },
    {
        "name": "HTTPAllow",
        "properties": {
            "description": "allow HTTP connections",
            "direction": "Inbound",
            "sourceAddressPrefix": "[parameters('source')]",
            "destinationAddressPrefix": "[parameters('destination')]",
            "sourcePortRange": "*",
            "destinationPortRange": "80",
            "access": "Allow",
            "protocol": "Tcp"
        }
    }
]
```

The template manage the priority on jumps of 10 from the first parameter to the last. DefaultInDeny and DefaultOutAllow rules are appended at the end to strictly forbid any non specified incoming protocol and to allow any non strictly forbidden outgoing protocol.