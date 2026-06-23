function Enable-LoopTenantSearch {
<#!
.SYNOPSIS
Enables tenant-wide search visibility for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Enable-LoopTenantSearch -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ RestrictContentOrgWideSearch = $false } -ActionDescription 'Enable Loop tenant search visibility'
}
