#Requires -Version 5

wslctl version default 2
wslctl registry add main https://store.rns.seres.lan/wsl/canonical
wslctl registry add srsrns https://store.rns.seres.lan/wsl/srsrns
wslctl registry update
