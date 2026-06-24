function Block-NewsletterSharingDomains {
<#!
.SYNOPSIS
Blocks sharing with the specified domains for a Newsletter container.
.PARAMETER Identity
The container identity.
.PARAMETER Domains
The list of blocked domains.
.EXAMPLE
Block-NewsletterSharingDomains -Identity 'container-id' -Domains 'contoso.com','fabrikam.com'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string[]]$Domains
    )

    Invoke-NewsletterContainerUpdate -Identity $Identity -Settings @{ SharingDomainRestrictionMode = 'BlockList'; SharingBlockedDomainList = $Domains -join " " } -ActionDescription 'Block Newsletter sharing for specified domains'
}
