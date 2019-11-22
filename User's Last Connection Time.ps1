Add-PSSnapin citrix*
foreach ($vdi in (Get-BrokerDesktop -AdminAddress ServerName -MaxRecordCount 20000)) {
    $time = $vdi.LastConnectionTime
    $poshformat = get-date($time)
    $newtime = (get-date).Subtract($poshformat)
    if ($vdi.HostedMachineName) {
        Get-BrokerDesktop -HostedMachineName $vdi.HostedMachineName -AdminAddress ServerName -MaxRecordCount 20000 | Select-Object HostedMachineName, @{N = 'LastConnectionTime'; E = { [string]$newtime.Days + "Days," + $newtime.Hours + "Hours," + $newtime.Minutes + "Minutes" } } | export-csv c:\temp\report.csv -notypeinformation -Append
        #To see data on the screen right away use below line.
        #write-host $vdi.HostedMachineName, $newtime.Days"Days," $newtime.Hours"Hours," $newtime.Minutes"Minutes" 
    }
}
