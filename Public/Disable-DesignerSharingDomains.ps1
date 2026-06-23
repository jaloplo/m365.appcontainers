function Disable-DesignerSharingDomains {
<#!
.SYNOPSIS
Removes sharing domain restrictions from a Designer container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Disable-DesignerSharingDomains -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-DesignerContainerUpdate -Identity $Identity -Settings @{ SharingDomainRestrictionMode = 'None'; SharingAllowedDomainList = ''; SharingBlockedDomainList = '' } -ActionDescription 'Disable Designer sharing domain restrictions'
}
