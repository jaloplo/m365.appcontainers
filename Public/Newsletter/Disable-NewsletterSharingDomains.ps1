function Disable-NewsletterSharingDomains {
<#!
.SYNOPSIS
Removes sharing domain restrictions from a Newsletter container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Disable-NewsletterSharingDomains -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-NewsletterContainerUpdate -Identity $Identity -Settings @{ SharingDomainRestrictionMode = 'None'; SharingAllowedDomainList = ''; SharingBlockedDomainList = '' } -ActionDescription 'Disable Newsletter sharing domain restrictions'
}
