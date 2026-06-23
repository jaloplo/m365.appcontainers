function Add-LoopWriter {
<#!
.SYNOPSIS
Adds a writer to a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Add-LoopWriter -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-LoopUserCommand -Action Add -Role Writer -Identity $Identity -User $User
}
