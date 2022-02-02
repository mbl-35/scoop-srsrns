#Requires -Version 5

$old_erroractionpreference = $erroractionpreference
$erroractionpreference = 'stop' # quit if anything goes wrong

$scoop_registries = @{
    scoopux  = 'https://github.com/prezesp/scoop-viewer-bucket.git'       # Requiered by scoop-viewer
    srsrns   = 'https://github.com/mbl-35/scoop-srsrns.git'               # Requiered by srsrns tools
}

$scoop_buckets = @(
    '7zip',                                 # Compress/Uncompress Tool
    #'scoop-viewer',                        # A gui client for scoop
    'vlc',                                  # VLC media player
    'googlechrome',                         # Google Browser
    #'ungoogled-chrome',                    # Browser aiming for safer/faster and more stable way
    'firefox',                              # Popular open source web browser
    'srsrns/firefox',                       # Firefox French version pre-configured
    'firefox-addon-adblock-ultimate',       # AdBlocUltimate Firefox addon
    'brave',                                # Secure, Fast & Private Web Browser with Adblocker
    'keepass',                              # Light-weight and easy-to-use password manager
    'keepass-plugin-keepassrpc',            # KeePassRPC KeePass plugin for Kee
    'firefox-addon-keefox',                 # Firefox Kee integration addon
    'rainmeter',                            # A desktop customization tool
    'nagstamon',                            # A status monitor for the desktop (Nagios cli)
    #'ccleaner',                            # Number-one tool for cleaning PC
    #'flux',                                # Makes the color of your computer's display adapt to the time of day
    #'windows-terminal',                    # The new Windows Terminal, and the original Windows console host
    'tabby',                                # A terminal for a more modern age
    'vscode',                               # Lightweight but powerful source code editor
    'vscode-context-fr',                    # Add explorer context menu entries for vscode - French version
    'notepadplusplus',                      # A free source code editor and Notepad replacement that supports several languages
    'notepadplusplus-context-fr',           # Add explorer context menu entries for notepad++ - French version
    'winscp',                               # Copy files between a local computer and remote servers using FTP, FTPS, SCP, SFTP, WebDAV or S3 file transfer protocols
    'winmerge',                             # Differencing and merging tool, that compares both folders and files
    #'heidisql',                            # See and edit data and structures from computers running MariaDB, MySQL, Microsoft SQL or PostgreSQL
    #'dbeaver',                             # Database tool for developers, SQL programmers, database administrators and analysts
    'wslctl',                               # Wsl distribution wrapper with cache manager
    'wslctl-srsrns-config',                 # Wsl distribution wrapper with cache manager
    'wsl-vpnkit',                           # Provide network connectivity to the WSL2 VM while connected to VPNs on the Windows host
    'wsl-vpnkit-tray'                       # Controls (start/stop) Wsl-Vpnkit instance with a tray icon
)


#### MAIN
$scoop_registries.GetEnumerator() | %{ scoop bucket add $_.key $_.value }
scoop update
$scoop_buckets| ForEach-Object { scoop install $_}

$erroractionpreference = $old_erroractionpreference # Reset $erroractionpreference to original value
