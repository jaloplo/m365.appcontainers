function Remove-LoopOwner {
<#!
.SYNOPSIS
Removes an owner from a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Remove-LoopOwner -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-LoopUserCommand -Action Remove -Role Owner -Identity $Identity -User $User
}
