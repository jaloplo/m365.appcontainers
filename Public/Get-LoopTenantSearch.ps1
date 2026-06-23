function Get-LoopTenantSearch {
<#!
.SYNOPSIS
Gets the current tenant search configuration for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Get-LoopTenantSearch -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Get-LoopContainerSetting -Identity $Identity -PropertyNames @('RestrictContentOrgWideSearch') -DisplayName 'TenantSearch'
}
