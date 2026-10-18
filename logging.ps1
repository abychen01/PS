#logging using functions

function write-log {
    param([string]$log_text)
    
    $time_stamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss.fff"
    $log_file = '/Users/abychen/Documents/VS Code/PS/test folders/log.txt'
    $user = [System.Environment]::UserName

    Add-Content -Path $log_file -Value "$time_stamp | $user : $log_text"
}


write-log "added folder"