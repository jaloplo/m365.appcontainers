function Disable-DesignerTenantSearch {
<#!
.SYNOPSIS
Restricts tenant-wide search visibility for a Designer container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Disable-DesignerTenantSearch -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-DesignerContainerUpdate -Identity $Identity -Settings @{ RestrictContentOrgWideSearch = $true } -ActionDescription 'Disable Designer tenant search visibility'
}
