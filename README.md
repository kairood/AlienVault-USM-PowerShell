# AlienVault-USM-PowerShell
A bunch of useful PowerShell scripts to quickly pull events and alarm data from AlienVault USM

## Get-USMAPIToken & Get-USMAlarms

How to use the two functions to pull 500 open alarms from USM Anywhere with alarms in 

Get-USMAPIToken -Tenant XXXX -apiuser XXXXX -apipass XXXXX | Get-USMAlarms -Tenant XXXX -status open -size 500 -sort  ; $Alarms

How to use the two functions to pull 500 Events from USM Anywhere for particular plugin

Get-USMAPIToken -Tenant XXXX -apiuser XXXXX -apipass XXXXX | Get-USMEvents -Tenant XXXX -size 500 -plugin "Dell SonicWall UTM" ; $Events
