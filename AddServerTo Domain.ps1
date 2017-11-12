Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system" -Name "EnableLUA" -Value "0"
write-host "Please enter Domain Name"
$domain = Read-Host
$credential = Get-Credential
Add-Computer -DomainName $domain -Credential $credential -Passthru -Verbose -Restart -Force