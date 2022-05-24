"###############################################################"
"Now running : " + $MyInvocation.MyCommand.Path
"###############################################################"


################################################################
"CREATE AN APPLICATION GATEWAY :"

$Global:AGName = "alexeiag"
"AG Name : "  + $AGName

$Global:AGAddressPool = "vm-backend"
"AG Backend Address Pool : "  + $AGAddressPool

$Global:AGHTTPSettings = "http-setting"
"AG HTTP Settings : "  + $AGHTTPSettings

az network application-gateway create `
    --resource-group $RGName `
    --name $AGName `
    --vnet-name $VNETName `
    --subnet $SUBNET2Name `
    --public-ip-address ag-ip 

az network application-gateway address-pool create `
    --resource-group $RGName `
    --gateway-name $AGName `
    --name $AGAddressPool `
    --servers $IP1 $IP2

az network application-gateway http-settings create `
    --resource-group $RGName `
    --gateway-name $AGName `
    --name $AGHTTPSettings `
    --port 80 `
    --protocol Http
    # [--affinity-cookie-name]
    # [--auth-certs]
    # [--connection-draining-timeout]
    # [--cookie-based-affinity {Disabled, Enabled}]
    # [--enable-probe {false, true}]
    # [--host-name]
    # [--host-name-from-backend-pool {false, true}]
    # [--no-wait]
    # [--path]
    # [--probe]
    # [--root-certs]
    # [--timeout]

# az network application-gateway rule create `
#     --resource-group $RGName `
#     --gateway-name $AGName `
#     --name http-listener `
#     --address-pool $AGAddressPool `
#     --http-settings $AGHTTPSettings
#     # [--http-listener]
#     # [--no-wait]
#     # [--priority]
#     # [--redirect-config]
#     # [--rewrite-rule-set]
#     # [--rule-type]
#     # [--url-path-map]
    
# az network application-gateway http-listener create `
#     --resource-group $RGName `
#     --name http-listener `
#     --gateway-name $AGName `
#     --frontend-port 80 
#     # --frontend-ip 
#     # [--host-name]
#     # [--host-names]
#     # [--no-wait]
#     # [--ssl-cert]
#     # [--ssl-profile-id]
#     # [--waf-policy]

