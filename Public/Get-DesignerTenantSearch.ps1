function Get-DesignerTenantSearch {
<#!
.SYNOPSIS
Gets the current tenant search configuration for a Designer container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Get-DesignerTenantSearch -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Get-DesignerContainerSetting -Identity $Identity -PropertyNames @('RestrictContentOrgWideSearch') -DisplayName 'TenantSearch'
}
