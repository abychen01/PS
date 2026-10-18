#creating basic functions

function print_hello {
    Write-Output "hello"
}

print_hello
print_hello

function print_name {
    param([string] $name
    )
    Write-Host "Hello $name"
}


$name = Read-Host "enter name"
print_name $name

print_name (Read-Host "enter name again")