function Disable-NewsletterTenantSearch {
<#!
.SYNOPSIS
Restricts tenant-wide search visibility for a Newsletter container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Disable-NewsletterTenantSearch -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-NewsletterContainerUpdate -Identity $Identity -Settings @{ RestrictContentOrgWideSearch = $true } -ActionDescription 'Disable Newsletter tenant search visibility'
}
