function Block-LoopDownload {
<#!
.SYNOPSIS
Blocks downloads for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Block-LoopDownload -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ BlockDownloadPolicy = $true; ExcludeBlockDownloadPolicyContainerOwners = $false } -ActionDescription 'Block Loop container downloads'
}
