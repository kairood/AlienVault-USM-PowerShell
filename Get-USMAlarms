
$global:Alarms = $null # Set Global Alarms variable to call on later after Function completed

Function Get-USMAlarms { 

param([Parameter(Mandatory=$true)][String] $Tenant, [Parameter(ValueFromPipeline)] $apitoken, [Parameter(Mandatory=$true)][String] $status, [Parameter(Mandatory=$true)][String] $size)


# Forcing TLS 1.2 API Connections
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Generate a New Object and add access token for further requests. 
# PLEASE NOTE TOKENS CURRENTLY EXPIRE AFTER 15 MINUTES AFTER BEING GENERATED!
# https://www.alienvault.com/documentation/usm-anywhere/api/alienvault-api.htm
$tokenheaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$tokenheaders.Add("Authorization", "Bearer $apitoken")

Write-Output "Gathering Alarm Data... `n"

# Get Filtered Alarms where status is open and Strategy is Credential Abuse
$GetAlarms = Invoke-RestMethod "https://$Tenant.alienvault.cloud/api/2.0/alarms?status=$status&size=$size" -SessionVariable 'Session'  -ContentType 'application/json' -Headers $tokenheaders -Method Get

$global:Alarms = $GetAlarms._embedded 
}
