#Create schedule task with the script. It sends messages to logged on users every 5 minutes and logs off user's session after 30 mins.

$Timer = 2
while (Invoke-Command -ScriptBlock { quser } ) {
    if ($Timer -ne "0") {
        msg * "This machine will be restarted in $Timer mins. Please save your work and logoff."
        Start-Sleep -Seconds 60
        $Timer = $Timer - 1
    }
    else {
        msg * "Grace period complete. Restarting now..."
        start-sleep -seconds 5
        Restart-Computer
        break
    }
}

if (!(Invoke-Command -ScriptBlock { quser } )) {
    Restart-Computer
}
