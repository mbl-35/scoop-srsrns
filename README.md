# scoop-srsrns

SRSRNS  buckets

List of my personal non admin buckets to be used with used with [scoop](https://scoop.sh/).


Requiements:
- PowerShell5 or later (include Powershell Core)
- .NET Framework 4.5 (or later)


## Usage

This repo can be used for :
- add srsrns buckets to an existing scoop instance, or
- automate the scoop installation and buckets usage

### Integrate to an existing scoop instance

```PS1
scoop bucket add srsrns https://raw.githubusercontent.com/mbl-35/scoop-srsrns
```

### OneLine Install

This process install **scoop** and **tools** defined in `bin` directory with one line:
```PS1
iwr -useb https://raw.githubusercontent.com/mbl-35/scoop-srsrns/main/bin/install-all.ps1 | iex
```


> Note: if you get an error you might need to change the execution policy (i.e. enable Powershell) with
> ```PS1
>  Set-ExecutionPolicy RemoteSigned -scope CurrentUser
>  ```

### Steps Install
1. Install Scoop

    Review, download and execute the `bin/install-scoop.ps1` powershell script to :
    - set the `SCOOP` environment variable (where everything is stored)
    - install **scoop**
    - add `extra` bucket
    - update scoop registries.

    Oneline Powershell command installer:

    ```PS1
    iwr -useb https://raw.githubusercontent.com/mbl-35/scoop-srsrns/main/bin/install-scoop.ps1 | iex
    ```

    > This script is targeted to be generic (no personal/entity specific). Can be used as is...

1. Install Tools

    Once **scoop** is installed (step 1), the `bin/install-tools.ps1` script acts to :
    - setup new bucket **srsrns** to this git repository,
    - setup new bucket **scoopux** to scoop-viewer git repository (optional),
    - update scoop registries.
    - install all listed buckets to set/configure the desktop.

    Oneline Powershell command line (if no desired changes):
    ```PS1
    iwr -useb https://raw.githubusercontent.com/mbl-35/scoop-srsrns/main/bin/install-tools.ps1 | iex
    ```

    > You can download this script, review it, changes buckets to install, ... to feet your needs !



## Development Notes

To this repo manager: 

- usage of powershell script buckets (like `wslctl`) require powershell client
  to restart in order to clean internal powershell compilation cache of ps1 files...

- use `auto-update.ps1` script to check new releases on products repos.
  This will refresh the json files with autoupdate property if new release 
  has been detected.
  
- use local file to validate installation for new bucket as follow:
    ```powershell
    scoop install \path\to\app.json
    ```

- Firefox required no other profiles in %APPDATA%/Mozilla/Firefox (delete this dir...)
- Goocle Chrome (&brave) does not allow to install extensions from external...