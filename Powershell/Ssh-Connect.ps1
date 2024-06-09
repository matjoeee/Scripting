###############################################
### PowerShell script to connect to machine ###
###############################################

# Variables
$ip = "[IP-address]"
$uname = "[username]"

# Check to see if available
if (Test-Connection -ComputerName $ip -Count 2 -Quiet) {
    Write-Host "Connection complete..."
    ssh $uname@$ip
} else {
    Write-Host "Could not connect..."
}