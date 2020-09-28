$list = Get-Content c:\temp\list.txt
foreach ($vdi in $list) {
    Write-Host $vdi
    $session = New-PSSession -ComputerName $vdi
    Invoke-Command -ScriptBlock { Set-ItemProperty -Path 'HKLM:\SOFTWARE\Citrix\VirtualDesktopAgent' -Name 'ListOfDDCs' -Value 'Citrix Server Name' } -Session $session
    Get-Service brokeragent -ComputerName $vdi | Restart-Service
}
