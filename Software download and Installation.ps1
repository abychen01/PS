function write-log {
    param([string]$log_text)
    
    $time_stamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss.fff"
    $log_file = 'C:\log.txt'
    $user = [System.Environment]::UserName

    Add-Content -Path $log_file -Value "$time_stamp | $user : $log_text"
}

if (-not (Test-Path -Path "$env:TEMP\Downloads")) {
    mkdir "$env:TEMP\Downloads"
}

$chrome_install_path = "$env:TEMP\Downloads\chrome_installer.exe"

try {
    Invoke-WebRequest -Uri "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -ErrorAction Stop -OutFile $chrome_install_path
    write-log "Chrome downloaded"
}
catch {
    write-log "Chrome download failed. Error: $($_.Exception.Message)"
}

try {
    $chrome_install = Start-Process "$env:TEMP\Downloads\chrome_installer.exe" `
    -ArgumentList /silent, /install `
    -ErrorAction Stop -Wait `
    -PassThru
    write-log "Chrome installation completed. Exit code - $($chrome_install.ExitCode)"
}
catch {
    write-log "Chrome installation failed. Error: $($_.Exception.Message)"
}