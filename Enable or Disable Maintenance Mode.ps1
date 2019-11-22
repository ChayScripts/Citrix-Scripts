Function Global:Enable-MaintenanceMode([string]$servername) {
Add-PSSnapin citrix*
$name = (Get-BrokerSharedDesktop -HostedMachineName $servername).MachineName
set-BrokerSharedDesktop $name -InMaintenanceMode $true
}


Function Global:Disable-MaintenanceMode([string]$servername) {
Add-PSSnapin citrix*
$name = (Get-BrokerSharedDesktop -HostedMachineName $servername).MachineName
set-BrokerSharedDesktop $name -InMaintenanceMode $false
}

