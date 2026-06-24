function Get-NewsletterSharingDomains {
<#!
.SYNOPSIS
Gets the current sharing domain configuration for a Newsletter container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Get-NewsletterSharingDomains -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Get-NewsletterContainerSetting -Identity $Identity -PropertyNames @('SharingDomainRestrictionMode','SharingAllowedDomainList','SharingBlockedDomainList') -DisplayName 'SharingDomains'
}
