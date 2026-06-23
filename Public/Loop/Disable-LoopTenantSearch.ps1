function Disable-LoopTenantSearch {
<#!
.SYNOPSIS
Restricts tenant-wide search visibility for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Disable-LoopTenantSearch -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ RestrictContentOrgWideSearch = $true } -ActionDescription 'Disable Loop tenant search visibility'
}
