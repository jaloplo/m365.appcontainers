function Get-NewsletterTenantSearch {
<#!
.SYNOPSIS
Gets the current tenant search configuration for a Newsletter container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Get-NewsletterTenantSearch -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Get-NewsletterContainerSetting -Identity $Identity -PropertyNames @('RestrictContentOrgWideSearch') -DisplayName 'TenantSearch'
}
