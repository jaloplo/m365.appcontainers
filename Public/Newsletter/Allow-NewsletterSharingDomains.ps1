function Allow-NewsletterSharingDomains {
<#!
.SYNOPSIS
Allows sharing only with the specified domains for a Newsletter container.
.PARAMETER Identity
The container identity.
.PARAMETER Domains
The list of allowed domains.
.EXAMPLE
Allow-NewsletterSharingDomains -Identity 'container-id' -Domains 'contoso.com','fabrikam.com'
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

    Invoke-NewsletterContainerUpdate -Identity $Identity -Settings @{ SharingDomainRestrictionMode = 'AllowList'; SharingAllowedDomainList = $Domains -join " " } -ActionDescription 'Allow Newsletter sharing only for specified domains'
}
