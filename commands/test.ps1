# $IP1 = (az vm list-ip-addresses -g $RGName -n $VM1Name | ConvertFrom-Json).virtualMachine

# $IP1.network.publicIpAddresses.ipAddress

# $frontendIP = (az network public-ip show `
#     --resource-group $RGName `
#     --name "${VMSSLoadBalancer}PublicIP" | ConvertFrom-Json).ipAddress

# $frontendIP


