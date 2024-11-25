Add-PSSnapIn citrix*
$DeliveryGroups = Get-BrokerDesktopGroup -MaxRecordCount 20000
$Applications = Get-BrokerApplication -MaxRecordCount 20000
 
$AppList = @()
 
foreach ($App in $Applications) {
    foreach ($DG in $DeliveryGroups) {
        if ($App.AssociatedDesktopGroupUids -match $DG.Uid) {
            $Report = New-Object -TypeName psobject
            $Report | Add-Member -MemberType NoteProperty -Name ApplicationName -Value $App.Name
            # Join the array of AssociatedUserFullNames into a single string
            $AssociatedUserFullNames = $App.AssociatedUserFullNames -join ', '
            $Report | Add-Member -MemberType NoteProperty -Name ApplicationGroupName -Value $AssociatedUserFullNames
            $Report | Add-Member -MemberType NoteProperty -Name DeliveryGroupName -Value $DG.Name
            $AppList += $Report
        }
    }
}
 
$AppList | Export-Csv c:\temp\applist.csv -NoTypeInformation
