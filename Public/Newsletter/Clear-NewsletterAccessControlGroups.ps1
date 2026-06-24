function Clear-NewsletterAccessControlGroups {
<#!
.SYNOPSIS
Clears all restricted access control groups from a Newsletter container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Clear-NewsletterAccessControlGroups -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-NewsletterContainerUpdate -Identity $Identity -Settings @{ ClearRestrictedAccessControl = $true } -ActionDescription 'Clear Newsletter restricted access control groups'
}
