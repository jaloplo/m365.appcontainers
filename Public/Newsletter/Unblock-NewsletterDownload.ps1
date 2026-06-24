function Unblock-NewsletterDownload {
<#!
.SYNOPSIS
Removes download restrictions from a Newsletter container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Unblock-NewsletterDownload -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-NewsletterContainerUpdate -Identity $Identity -Settings @{ BlockDownloadPolicy = $false } -ActionDescription 'Unblock Newsletter container downloads'
}
