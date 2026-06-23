function Allow-LoopSharingDomains {
<#!
.SYNOPSIS
Allows sharing only with the specified domains for a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER Domains
The list of allowed domains.
.EXAMPLE
Allow-LoopSharingDomains -Identity 'container-id' -Domains 'contoso.com','fabrikam.com'
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

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ SharingDomainRestrictionMode = 'AllowList'; SharingAllowedDomainList = $Domains -join " " } -ActionDescription 'Allow Loop sharing only for specified domains'
}
