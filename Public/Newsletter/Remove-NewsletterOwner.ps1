function Remove-NewsletterOwner {
<#!
.SYNOPSIS
Removes an owner from a Newsletter container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Remove-NewsletterOwner -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-NewsletterUserCommand -Action Remove -Role Owner -Identity $Identity -User $User
}
