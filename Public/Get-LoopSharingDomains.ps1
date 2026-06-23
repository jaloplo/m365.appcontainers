function Get-LoopSharingDomains {
<#!
.SYNOPSIS
Gets the current sharing domain configuration for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Get-LoopSharingDomains -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Get-LoopContainerSetting -Identity $Identity -PropertyNames @('SharingDomainRestrictionMode','SharingAllowedDomainList','SharingBlockedDomainList') -DisplayName 'SharingDomains'
}
