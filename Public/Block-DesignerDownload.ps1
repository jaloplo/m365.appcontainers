function Block-DesignerDownload {
<#
.SYNOPSIS
Blocks downloads for a Designer container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Block-DesignerDownload -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-DesignerContainerUpdate -Identity $Identity -Settings @{ BlockDownloadPolicy = $true; ExcludeBlockDownloadPolicyContainerOwners = $false } -ActionDescription 'Block Designer container downloads'
}
