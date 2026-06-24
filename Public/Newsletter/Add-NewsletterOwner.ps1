function Add-NewsletterOwner {
<#
.SYNOPSIS
Adds an owner to a Newsletter container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Add-NewsletterOwner -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-NewsletterUserCommand -Action Add -Role Owner -Identity $Identity -User $User
}
