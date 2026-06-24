function Disable-NewsletterAccessControl {
<#!
.SYNOPSIS
Disables restricted access control for a Newsletter container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Disable-NewsletterAccessControl -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-NewsletterContainerUpdate -Identity $Identity -Settings @{ EnableRestrictedAccessControl = $false } -ActionDescription 'Disable Newsletter restricted access control'
}
