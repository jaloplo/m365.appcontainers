function Block-DesignerDownloadExceptOwners {
<#
.SYNOPSIS
Blocks downloads for a Designer container except for container owners.
.PARAMETER Identity
The container identity.
.EXAMPLE
Block-DesignerDownloadExceptOwners -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-DesignerContainerUpdate -Identity $Identity -Settings @{ BlockDownloadPolicy = $true; ExcludeBlockDownloadPolicyContainerOwners = $true } -ActionDescription 'Block Designer container downloads except for owners'
}
