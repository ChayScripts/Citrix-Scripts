
#Create PSsession on your DDC. 
$Session = New-PSsession -Computername "CitrixServerName" 
#Add Citrix PowerShell Snapins in the session. 
Invoke-Command -Command {add-pssnapin Citrix.*} -Session $Session 
#Import the session created above and a new prefix to all the Citrix commands. 
Import-PSSession -Session $Session -Module Citrix.* -Prefix Ctx

#In your script, you can now run the Citrix PowerShell commands by adding the prefix. 
#For example, Get-BrokerSession cmdlet now becomes Get-CtxBrokerSession.
