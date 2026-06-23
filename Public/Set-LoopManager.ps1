function Set-LoopManager {
<#!
.SYNOPSIS
Sets a user as manager in a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Set-LoopManager -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-LoopUserCommand -Action Set -Role Manager -Identity $Identity -User $User
}
