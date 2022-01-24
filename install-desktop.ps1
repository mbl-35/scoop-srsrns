#Requires -Version 5

# Loads all configuration files and runs all scripts.
# If you run an unsigned script that was downloaded from the internet,
# you're prompted for permission before it runs.
#   ==> Accpept with 'O' or 'Y'
Set-ExecutiOnPolicy Unrestricted -Scope CurrentUser
$old_erroractionpreference = $erroractionpreference
$erroractionpreference = 'stop' # quit if anything goes wrong

if (($PSVersionTable.PSVersion.Major) -lt 5) {
    Write-Output "PowerShell 5 or later is required to run Install script."
    Write-Output "Upgrade PowerShell: https://docs.microsoft.com/en-us/powershell/scripting/setup/installing-windows-powershell"
    break
}

# show notification to change execution policy:
$allowedExecutionPolicy = @('Unrestricted', 'RemoteSigned', 'ByPass')
if ((Get-ExecutionPolicy).ToString() -notin $allowedExecutionPolicy) {
    Write-Output "PowerShell requires an execution policy in [$($allowedExecutionPolicy -join ", ")] to run Install script."
    Write-Output "For example, to set the execution policy to 'RemoteSigned' please run :"
    Write-Output "'Set-ExecutionPolicy RemoteSigned -scope CurrentUser'"
    break
}

if ([System.Enum]::GetNames([System.Net.SecurityProtocolType]) -notcontains 'Tls12') {
    Write-Output "Scoop requires at least .NET Framework 4.5"
    Write-Output "Please download and install it first:"
    Write-Output "https://www.microsoft.com/net/download"
    break
}


# Install scoop (app package manager)
$env:SCOOP="$env:LOCALAPPDATA\Scoop"
[Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User')
if (-Not (test-path $env:LOCALAPPDATA\Scoop\apps\scoop\current )) {
    Invoke-WebRequest -useb https://get.scoop.sh | Invoke-Expression
}
scoop install git



# Add extra repositories (buckets) & update
scoop bucket add extras
scoop bucket add scoop-viewer-bucket https://github.com/prezesp/scoop-viewer-bucket.git
scoop bucket add srsrns https://github.com/mbl-35/scoop-srsrns
scoop update


# Install desktop apps (comment non desirable)
scoop install 7zip
scoop install vls
scoop install googlechrome
scoop install firefox
scoop install brave
scoop install winscp
scoop install keepass keepass-plugin-keepassrpc

scoop install notepadplusplus notepadplusplus-context-fr
scoop install nagstamon
scoop install ccleaner
scoop install flux
scoop install scoop-viewer

# Install develoment apps (comment non desirable)
scoop install windows-terminal
scoop install tabby
scoop install vscode vscode-context-fr
scoop install heidisql
scoop install dbeaver
scoop install rainmeter

scoop install wslctl
scoop install wsl-vpnkit wsl-vpnkit-tray


# Install & Configure wslctl
# Note: just after install, wslctl may need a new powershell console
wslctl version default 2
wslctl registry add main        https://store.rns.seres.lan/wsl/canonical    # optionnal
wslctl registry add srsrns      https://store.rns.seres.lan/wsl/srsrns
wslctl registry update



$erroractionpreference = $old_erroractionpreference # Reset $erroractionpreference to original value
