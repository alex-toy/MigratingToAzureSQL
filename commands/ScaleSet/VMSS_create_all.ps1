"###############################################################"
"Now running : " + $MyInvocation.MyCommand.Path
"###############################################################"


################################################################
"CREATE A VNET :"

$Global:VNETName = "alexeivnet"
"VNET Name : "  + $VNETName

$Global:SUBNET1Name = "vm-subnet"
"SUBNET 1 Name : "  + $SUBNET1Name

$Global:SUBNET2Name = "ag-subnet"
"SUBNET 2 Name : "  + $SUBNET2Name

az network vnet create `
    --resource-group $RGName `
    --location $RGLocation `
    --name $VNETName `
    --address-prefixes 10.1.0.0/16 `

az network vnet subnet create `
    --resource-group $RGName `
    --vnet-name $VNETName `
    --name $SUBNET1Name `
    --address-prefixes 10.1.1.0/24 

az network vnet subnet create `
    --resource-group $RGName `
    --vnet-name $VNETName `
    --name $SUBNET2Name `
    --address-prefixes 10.1.2.0/24 



################################################################
"CREATE VM1 :"

$Global:VM1Name = "alexeivm1"
"VM1 Name : "  + $VM1Name

$Global:VM1AdminUsername = "alexei"
"VM1 Admin User name : "  + $VM1AdminUsername

az vm create `
    --resource-group $RGName `
    --name $VM1Name `
    --subnet $SUBNET1Name `
    --vnet-name $VNETName `
    --image UbuntuLTS `
    --generate-ssh-keys `
    --public-ip-address VM1-publicIP `
    --admin-username $VM1AdminUsername `
    --admin-password Alexei.80.VM

$Global:IP1 = (az vm list-ip-addresses `
    -g $RGName `
    -n $VM1Name | ConvertFrom-Json).virtualMachine.network.publicIpAddresses.ipAddress
"VM1 IP : ${IP1}"



################################################################
"CREATE VM2 :"

$Global:VM2Name = "alexeivm2"
"VM2 Name : "  + $VM2Name

$Global:VM2AdminUsername = "alexei"
"VM2 Admin User name : "  + $VM2AdminUsername

az vm create `
    --resource-group $RGName `
    --name $VM2Name `
    --subnet $SUBNET1Name `
    --vnet-name $VNETName `
    --image UbuntuLTS `
    --generate-ssh-keys `
    --public-ip-address VM2-publicIP `
    --admin-username $VM2AdminUsername `
    --admin-password Alexei.80.VM

$Global:IP2 = (az vm list-ip-addresses `
    -g $RGName `
    -n $VM2Name | ConvertFrom-Json).virtualMachine.network.publicIpAddresses.ipAddress
"VM2 IP : ${IP2}"





    






















# ################################################################
# "LOAD BALANCER configuration :"

# $Global:VMSSLoadBalancer = "alexeilb"
# "VMSS Load Balancer : "  + $VMSSLoadBalancer


# ################################################################
# "CREATE A LOAD BALANCER :"

# az network lb create `
#     --resource-group $RGName `
#     --name $VMSSLoadBalancer `
#     --sku Standard `
#     --vnet-name $VNETName `
#     --subnet $SUBNETName `
#     --frontend-ip-name myFrontEnd `
#     --backend-pool-name myBackEndPool


# ################################################################
# "VMSS configuration :"

# $Global:VMSSName = "alexeivmss"
# "VMSS name : "  + $VMSSName

# $Global:VMSSImage = "UbuntuLTS"
# "VMSS Image : "  + $VMSSImage

# # Standard_DS1_v2 Standard_B1ls Standard_E16bds_v5
# $Global:VMSSSKU = "Standard_E16bds_v5"
# "SKU : "  + $Global:VMSSSKU

# $Global:VMSSAdmin = "alexeiadmin"
# "VMSS Admin user name : "  + $VMSSAdmin

# # The password length must be between 12 and 72. 
# # Password must have the 3 of the following: 
# # 1 lower case character, 1 upper case character, 1 number and 1 special character.
# $Global:VMSSPassword = "Alexeipw.1234"
# "VMSS Admin Password : "  + $VMSSPassword

# $Global:VMSSCustomData = "cloud-init.txt"
# "VMSS Custom Data : "  + $VMSSCustomData

# $Global:VMSSInstanceCount = 2
# "VMSS Instance Count : "  + $VMSSInstanceCount


# ################################################################
# "CREATE A VMSS :"

# az vmss create `
#     --name $VMSSName `
#     --resource-group $RGName `
#     --image $VMSSImage `
#     --vm-sku $VMSSSKU `
#     --load-balancer $VMSSLoadBalancer `
#     --admin-username $VMSSAdmin `
#     --admin-password $VMSSPassword `
#     --custom-data $VMSSCustomData `
#     --instance-count $VMSSInstanceCount
#     # --public-ip-address-dns-name my-globally-dns-name `
#     # --vnet-name MyVnet `
#     # --subnet MySubnet `
#     # --generate-ssh-keys
#     # --admin-password

    