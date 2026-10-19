
Get-ItemProperty `
'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*', `
'HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*', `
'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*' |
Where-Object { $_.DisplayName -like "*app_name*" } |
Select DisplayName, UninstallString

If it is msi then

Start-Process msiexec.exe `
>> -ArgumentList "/x{uninstall_string_value} /qn" `
>> -wait

For exe


Start-Process `
    -FilePath "uninstall_string_value" `
    -ArgumentList "/uninstall","/silent" `
    -Wait







