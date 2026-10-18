#try catch

$log_file = '/Users/abychen/Documents/VS Code/PS/test folders/log.txt'

function write-log {
    param([string]$log_text,
    [string]$exception_error
    )
    
    $time_stamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss.fff"
    $log_file = '/Users/abychen/Documents/VS Code/PS/test folders/log.txt'
    $user = [System.Environment]::UserName

    Add-Content -Path $log_file -Value "$time_stamp | $user : $log_text $exception_error"
}

try {
    Get-Content $log_file -ErrorAction Stop
    Write-Host "File exists"
    write-log -log_text "test-path is success"

}
catch {
    <#Do this if a terminating exception happens#>
    write-log -log_text "Test-path failed, " -exception_error $_.Exception.Message
}