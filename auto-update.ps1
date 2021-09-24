# Find scoop base directory
$ScoopScriptPath = (Get-Command scoop).Path
$ScoopBasePath = (Get-Item $ScoopScriptPath).Directory.Parent
$ScoopCheckUpdate = Join-Path -Path $ScoopBasePath.FullName -ChildPath "\apps\scoop\current\bin\checkver.ps1"

# Get the bukets location:
$BucketPath = Join-Path -Path $PSScriptRoot -ChildPath "bucket"


# List updatable
Write-Host "-------------- Updatable List -----------------"
& $ScoopCheckUpdate -Dir $BucketPath

# Update process
Write-Host "-------------- Updating -----------------------"
& $ScoopCheckUpdate -Dir $BucketPath -Update
Write-Host "done"
Write-Host
