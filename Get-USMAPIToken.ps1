
Function Get-USMAPIToken {


param([Parameter(Mandatory=$true)][String] $Tenant, [Parameter(Mandatory=$true)][String] $apiuser, [Parameter(Mandatory=$true)][String] $apipass)


[Security.SecureString]$secureAPIPassword = ConvertTo-SecureString $apipass -AsPlainText -Force


#region Authentication
Write-Output "Generating Credentials `n"

# Forcing TLS 1.2 API Connections
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Authentication Joining
$pair = "${apiuser}:${apipass}" # Joining Credentials Together

# Converting to Base64 Encoding for Auth
$apiconvert = [System.Text.Encoding]::ASCII.GetBytes($pair)
$apiconverted = [System.Convert]::ToBase64String($apiconvert)

# Adding Basic to Base64 Encoding
$basicAuthValue = "Basic $apiconverted"

# API Headers
$headers = @{ Authorization = $basicAuthValue }

# Complete Inital Authentication for Access Token - To access the API, you will need to create a client ID and secret code in the USM Anywhere interface, and use that information to create a token. AlienVault uses OAuth 2.0 to authenticate against the REST APIs. 
# https://www.alienvault.com/documentation/api/usm-anywhere-api.htm?tocpath=API%7CAlienVault%C2%AE%20APIs%7C_____1#getting-started

Write-Output "Collecting API Access Token `n"

Try {
$LoginResponse = Invoke-RestMethod "https://$Tenant.alienvault.cloud/api/2.0/oauth/token?grant_type=client_credentials" -SessionVariable 'Session' -Headers $headers -Method 'POST' -ErrorAction Stop -ErrorVariable APILoginError
 
 }

Catch {
Write-Output "An Error Occured attempting to collect API Access Token with the following error $APILoginError `n"
}


$AuthenticatedHeader = $LoginResponse.access_token

$AuthenticatedHeader

}
