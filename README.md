# AlienVault-USM-PowerShell
A bunch of useful PowerShell scripts to quickly pull events and alarm data from AlienVault USM

## Get-USMAPIToken & Get-USMAlarms

How to use the two functions to pull 500 open alarms from USM Anywhere

Get-USMAPIToken -Tenant XXXX -apiuser XXXXX -apipass XXXXX | Get-USMAlarms -Tenant XXXX -status open -size 500
