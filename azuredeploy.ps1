Import-AzureRmContext -Path '~\azureProfile-si2.json'

$location = 'Brazil South'
$storageResourceGroup = 'test-leon-storage'
$storageName = 'testleon'
$storageContainer = 'templates'
$storageBaseURI = "https://$storageName.blob.core.windows.net/$storageContainer"
$resourceGroup = 'test-leon'

Get-AzureRmResourceGroup -Name "$storageResourceGroup" -ErrorVariable notPresent -ErrorAction SilentlyContinue
if ($notPresent) {
    New-AzureRmResourceGroup -Name "$storageResourceGroup" -Location "$location"
    Remove-Variable notPresent
}

Get-AzureRmStorageAccount -Name "$storageName" -ResourceGroupName "$storageResourceGroup" -ErrorVariable notPresent -ErrorAction SilentlyContinue
if ($notPresent) {
    New-AzureRmStorageAccount -ResourceGroupName "$storageResourceGroup" -Name "$storageName" -Type Standard_LRS -Location "$location"
    Remove-Variable notPresent
}
Set-AzureRmCurrentStorageAccount -ResourceGroupName "$storageResourceGroup" -Name "$storageName"
Get-AzureStorageContainer -Name "$storageContainer" -ErrorVariable notPresent -ErrorAction SilentlyContinue
if ($notPresent) {
    New-AzureStorageContainer -Name "$storageContainer" -Permission Off
    Remove-Variable notPresent
}
Get-ChildItem 'upload' -File -Recurse | Set-AzureStorageBlobContent -Container "$storageContainer" -Force
$tokenURI = New-AzureStorageContainerSASToken -Container "$storageContainer" -Permission r -ExpiryTime (Get-Date).AddMinutes(5)
$tokenURIsecret = ConvertTo-SecureString -String "$tokenURI" -AsPlainText -Force

Get-AzureRmResourceGroup -Name "$resourceGroup" -ErrorVariable notPresent -ErrorAction SilentlyContinue
if ($notPresent) {
    New-AzureRmResourceGroup -Name test-leon -Location "$location"
    Remove-Variable notPresent
}

New-AzureRmResourceGroupDeployment -TemplateUri "$storageBaseURI/nsg/calling.json$tokenURI" -TemplateParameterFile "./upload/nsg/parameterobject.json" -ResourceGroupName "$resourceGroup" -artifactsLocationSasToken $tokenURIsecret -Mode Complete -Force -Verbose
