function Enable-NewsletterTenantSearch {
<#!
.SYNOPSIS
Enables tenant-wide search visibility for a Newsletter container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Enable-NewsletterTenantSearch -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-NewsletterContainerUpdate -Identity $Identity -Settings @{ RestrictContentOrgWideSearch = $false } -ActionDescription 'Enable Newsletter tenant search visibility'
}
