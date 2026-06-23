function Block-LoopDownloadExceptOwners {
<#!
.SYNOPSIS
Blocks downloads for a Loop container except for container owners.
.PARAMETER Identity
The container identity.
.EXAMPLE
Block-LoopDownloadExceptOwners -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ BlockDownloadPolicy = $true; ExcludeBlockDownloadPolicyContainerOwners = $true } -ActionDescription 'Block Loop container downloads except for owners'
}
