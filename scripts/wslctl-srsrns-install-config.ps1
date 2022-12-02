#Requires -Version 5

wslctl version default 2
wslctl registry add canonical https://raw.githubusercontent.com/mbl-35/wslctl-main/main
wslctl registry add srsrns https://store.seres.dev/wsl/srsrns
wslctl registry update
