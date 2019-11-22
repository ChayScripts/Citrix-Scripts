Add-PSSnapin Citrix*
$vdiname = Get-Content C:\temp\vdilist.txt

#To register VDA with only one citrix server.
foreach ($vdi in $vdiname) {
    Write-Host $vdi #While executing the script we know which VDI we are working on.
    Invoke-Command -ComputerName $vdi -ScriptBlock { set-ItemProperty -Path HKLM:\SOFTWARE\citrix\VirtualDesktopAgent -Name ListOfDDCs -Value ONE_CITRIX_SERVER_NAME}
    Get-Service brokeragent -ComputerName $vdi | Restart-Service
}

#To update multiple citrix server names, or add new citrix server names
foreach ($vdi in $vdiname) {
    Write-Host $vdi #While executing the script we know which VDI we are working on.
    Invoke-Command -ComputerName $vdi -ScriptBlock { set-ItemProperty -Path HKLM:\SOFTWARE\citrix\VirtualDesktopAgent -Name ListOfDDCs -Value 'server1 server2 server3 server4' }
    Get-Service brokeragent -ComputerName $vdi | Restart-Service
}
