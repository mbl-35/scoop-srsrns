#Requires -Version 5

@('install-scoop', 'install-tools') | ForEach-Object { 
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString(
        "https://raw.githubusercontent.com/mbl-35/scoop-srsrns/main/bin/$_.ps1"
    )}
