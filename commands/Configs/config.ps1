################################################################
"Admin :"

$Global:Subscription = "alexeisubscription"
$Global:Subscription = "Azure subscription 1"
"Subscription : " + $Subscription



################################################################
"resource Group :"

#southcentralus centralus francecentral westus2 eastus centralus 
$Global:RGLocation = "centralus"
"resource Group Location : " + $RGLocation

$Global:RGName = "vmss-rg"
"Resource Group Name : " + $RGName



################################################################
"Secret key :"

$Global:SSHKeyName = "mySSHKey"
"Secret key name : "  + $SSHKeyName

$Global:SAKey = "SAKey"
"Storage Account key name : "  + $SAKey


#######################################################################
# Steps :

$script = "commands\ResourceGroup\ResourceGroup_create.ps1"
.$script

$script = "commands\ScaleSet\VMSS_create_all.ps1"
.$script

$script = "commands\VirtualMachine\VM_connect.ps1"
.$script

$script = "commands\ApplicationGateway\AG_create.ps1"
.$script






