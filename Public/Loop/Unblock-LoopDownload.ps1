function Unblock-LoopDownload {
<#!
.SYNOPSIS
Removes download restrictions from a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Unblock-LoopDownload -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ BlockDownloadPolicy = $false } -ActionDescription 'Unblock Loop container downloads'
}
