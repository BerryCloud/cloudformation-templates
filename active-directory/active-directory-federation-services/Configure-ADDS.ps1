param(
    [string]$domainNetbiosName = "DomainNetbiosName", 
    [string]$domainName = "DomainName", 
    [string]$safeModeAdministratorPassword = "SafeModeAdministratorPassword"
    )

Install-ADDSForest -DomainMode 6 -DomainName $domainName -DomainNetbiosName $domainNetbiosName -ForestMode 6 -SafeModeAdministratorPassword (convertto-securestring $safeModeAdministratorPassword -asplaintext -force) -Confirm:$false