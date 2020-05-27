Function Global:Enable-MaintenanceMode([string]$servername) {
Add-PSSnapin citrix*
$name = (Get-BrokerSharedDesktop -HostedMachineName $servername).MachineName
set-BrokerSharedDesktop $name -InMaintenanceMode $true
#For Static Desktops set-BrokerPrivateDesktop $name -InMaintenanceMode $true
}


Function Global:Disable-MaintenanceMode([string]$servername) {
Add-PSSnapin citrix*
$name = (Get-BrokerSharedDesktop -HostedMachineName $servername).MachineName
set-BrokerSharedDesktop $name -InMaintenanceMode $false
#For Static Desktops set-BrokerPrivateDesktop $name -InMaintenanceMode $false
}

