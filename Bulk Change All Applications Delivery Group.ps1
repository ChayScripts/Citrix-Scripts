# This script finds all the applications in "Old Delivery Group name" delivery group, changes the delivery group to "New Delivery Group Name" for all the apps in that delivery group. 

Add-PSSnapin Citrix*
 
$OldDGName = "OLD Delivery Group Name"
 
$NewdeliverygroupName = "New Delivery Group Name"
 
$oldDGUid = (Get-BrokerDesktopGroup -Name $OldDGName).Uid
 
$appslist = Get-BrokerApplication | Where-Object { $_.AssociatedDesktopGroupUids -match $oldDGUid }
 
$DGList = Get-BrokerDesktopGroup -Uid $oldDGUid
 
foreach ($app in $appslist) {
 
    foreach ($DG in $DGList) {
 
        if ($app.AssociatedDesktopGroupUids -match $DG.Uid) {
 
            $appuid = $app.Uid
            $uid = (Get-BrokerDesktopGroup -Name $NewdeliverygroupName).Uid
 
            Add-BrokerApplication  -DesktopGroup $uid -InputObject @($appuid)
            Set-Variable  -Name "_desktopGroupNames" -Value @($NewdeliverygroupName)
            Get-BrokerDesktopGroup  -Filter { (Name -in $_desktopGroupNames) } -MaxRecordCount 2147483647 -Property @("Uid") | Out-Null
            Remove-Variable  -Name "_desktopGroupNames"
            Remove-BrokerApplication  -DesktopGroup $OldDGName -Name $app.Name
        }
    }
}
