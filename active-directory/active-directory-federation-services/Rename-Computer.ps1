param([string]$newName = "NewName")

powershell.exe Rename-Computer -NewName $newName -Restart
