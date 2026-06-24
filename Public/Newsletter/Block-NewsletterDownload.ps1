function Block-NewsletterDownload {
<#!
.SYNOPSIS
Blocks downloads for a Newsletter container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Block-NewsletterDownload -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-NewsletterContainerUpdate -Identity $Identity -Settings @{ BlockDownloadPolicy = $true; ExcludeBlockDownloadPolicyContainerOwners = $false } -ActionDescription 'Block Newsletter container downloads'
}
