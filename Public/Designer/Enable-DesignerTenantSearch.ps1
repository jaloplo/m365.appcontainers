function Enable-DesignerTenantSearch {
<#!
.SYNOPSIS
Enables tenant-wide search visibility for a Designer container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Enable-DesignerTenantSearch -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-DesignerContainerUpdate -Identity $Identity -Settings @{ RestrictContentOrgWideSearch = $false } -ActionDescription 'Enable Designer tenant search visibility'
}
