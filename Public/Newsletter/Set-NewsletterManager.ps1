function Set-NewsletterManager {
<#!
.SYNOPSIS
Sets a user as manager in a Newsletter container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Set-NewsletterManager -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-NewsletterUserCommand -Action Set -Role Manager -Identity $Identity -User $User
}
