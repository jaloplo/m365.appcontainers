function Enable-NewsletterAccessControl {
<#!
.SYNOPSIS
Enables restricted access control for a Newsletter container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Enable-NewsletterAccessControl -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-NewsletterContainerUpdate -Identity $Identity -Settings @{ EnableRestrictedAccessControl = $true } -ActionDescription 'Enable Newsletter restricted access control'
}
