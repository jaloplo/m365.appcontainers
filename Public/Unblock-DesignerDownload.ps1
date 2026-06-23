function Unblock-DesignerDownload {
<#
.SYNOPSIS
Removes download restrictions from a Designer container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Unblock-DesignerDownload -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-DesignerContainerUpdate -Identity $Identity -Settings @{ BlockDownloadPolicy = $false; ExcludeBlockDownloadPolicyContainerOwners = $false } -ActionDescription 'Unblock Designer container downloads'
}
