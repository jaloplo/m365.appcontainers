function Add-NewsletterReader {
<#
.SYNOPSIS
Adds a reader to a Newsletter container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Add-NewsletterReader -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-NewsletterUserCommand -Action Add -Role Reader -Identity $Identity -User $User
}
