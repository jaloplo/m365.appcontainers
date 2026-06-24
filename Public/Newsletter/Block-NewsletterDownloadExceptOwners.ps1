function Block-NewsletterDownloadExceptOwners {
<#!
.SYNOPSIS
Blocks downloads for a Newsletter container except for container owners.
.PARAMETER Identity
The container identity.
.EXAMPLE
Block-NewsletterDownloadExceptOwners -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-NewsletterContainerUpdate -Identity $Identity -Settings @{ BlockDownloadPolicy = $true; ExcludeBlockDownloadPolicyContainerOwners = $true } -ActionDescription 'Block Newsletter container downloads except for owners'
}
