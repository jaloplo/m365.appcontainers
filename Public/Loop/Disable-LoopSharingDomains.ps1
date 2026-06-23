function Disable-LoopSharingDomains {
<#!
.SYNOPSIS
Removes sharing domain restrictions from a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Disable-LoopSharingDomains -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ SharingDomainRestrictionMode = 'None'; SharingAllowedDomainList = ''; SharingBlockedDomainList = '' } -ActionDescription 'Disable Loop sharing domain restrictions'
}
