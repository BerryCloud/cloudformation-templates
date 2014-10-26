param(
    [string]$domainAdminUser = "DomainAdminUser", 
    [string]$domainAdminPassword = "DomainAdminPassword"
    )
New-ADUser -Name $domainAdminUser -UserPrincipalName $domainAdminUser@$DomainDNSName -AccountPassword (ConvertTo-SecureString $domainAdminPassword -AsPlainText -Force) -Enabled $true -PasswordNeverExpires $true

Add-ADGroupMember 'Domain Admins' -Members $domainAdminUser