#Get date from citrix server and update it in vda.
#Run this script from citrix server.

$comp = "VDA Name"
$newdate=get-date 
Invoke-Command -ScriptBlock {param($newdate) Set-Date -Date $newdate } -ComputerName $comp -ArgumentList $y
Get-Service brokeragent -ComputerName $comp | Restart-Service
