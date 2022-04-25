<#
    Service password generator

    There are times when I want to create service accounts for services. Since those
    passwords will be stored in some form or another, I'd like to make them as complicated
    as possible. So I wrote this quick script to generate such passwords.

    Written by Panagis Syrigos
#>

Param (
    [Parameter(Mandatory = $true)] [int] $Counter
)

if ($Counter -le 0) {
    $Counter = 16
    Write-Warning "Invalid number, setting Counter to $Counter"
}
-join ((33..126) * $Counter | Get-Random -Count $Counter | Foreach-object { [char]$_ })
