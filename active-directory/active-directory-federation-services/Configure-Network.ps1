param(
    [string]$dns1 = "Dns1", 
    [string]$dns2 = "Dns2"
    )

$netip = Get-NetIPConfiguration
$ipconfig = Get-NetIPAddress | ?{$_.IpAddress -eq $netip.IPv4Address.IpAddress}
Get-NetAdapter | Set-NetIPInterface -DHCP Disabled
Get-NetAdapter | New-NetIPAddress -AddressFamily IPv4 -IPAddress $netip.IPv4Address.IpAddress -PrefixLength $ipconfig.PrefixLength -DefaultGateway $netip.IPv4DefaultGateway.NextHop

if(![string]::IsNullOrEmpty($dns1) -and [string]::IsNullOrEmpty($dns2))
{
	Get-NetAdapter | Set-DnsClientServerAddress -ServerAddresses "$dns1"
}
elseif(![string]::IsNullOrEmpty($dns1) -and ![string]::IsNullOrEmpty($dns2))
{
    Get-NetAdapter | Set-DnsClientServerAddress -ServerAddresses "$dns1","$dns2"
}
else
{
	Get-NetAdapter | Set-DnsClientServerAddress -ServerAddresses $netip.DNSServer.ServerAddresses
}