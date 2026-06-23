function Get-DesignerSharingDomains {
<#!
.SYNOPSIS
Gets the current sharing domain configuration for a Designer container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Get-DesignerSharingDomains -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Get-DesignerContainerSetting -Identity $Identity -PropertyNames @('SharingDomainRestrictionMode','SharingAllowedDomainList','SharingBlockedDomainList') -DisplayName 'SharingDomains'
}
