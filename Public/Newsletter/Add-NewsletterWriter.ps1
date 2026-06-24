function Add-NewsletterWriter {
<#
.SYNOPSIS
Adds a writer to a Newsletter container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Add-NewsletterWriter -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-NewsletterUserCommand -Action Add -Role Writer -Identity $Identity -User $User
}
