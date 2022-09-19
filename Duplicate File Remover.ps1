# CAUTION!!!
# This will REMOVE duplicate files in the current directory
Get-ChildItem | `
Select-Object -Property fullname, @{l="Hash";exp={(Get-FileHash $_).Hash}} | `
Group-Object -Property Hash | `
Where-Object {$_.Count -gt 1} | `
Select-Object -ExpandProperty Group | `
Sort-Object -Property Hash -Unique | `
ForEach-Object {Remove-Item -Path $_.FullName}

#Get-ChildItem | Select-Object -Property fullname, @{l="Hash";exp={(Get-FileHash $_).Hash}} | Group-Object -Property Hash | Where-Object {$_.Count -gt 1} | Select-Object -ExpandProperty Group | Sort-Object -Property Hash -Unique | ForEach-Object {Remove-Item -Path $_.FullName}