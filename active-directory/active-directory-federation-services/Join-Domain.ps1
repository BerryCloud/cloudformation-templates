param(
    [string]$domainName = "DomainName", 
    [string]$domainNetBIOSName  = "DomainNetBIOSName",
    [string]$domainAdminUser = "DomainAdminUser",
    [string]$domainAdminPassword = "DomainAdminPassword"
    )

Add-Computer -DomainName $domainName -Credential (New-Object System.Management.Automation.PSCredential('$domainNetBIOSName\\$domainAdminUser(ConvertTo-SecureString $domainAdminPassword -AsPlainText -Force))) -Restart