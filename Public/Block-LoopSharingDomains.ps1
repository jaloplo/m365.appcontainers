function Block-LoopSharingDomains {
<#!
.SYNOPSIS
Blocks sharing with the specified domains for a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER Domains
The list of blocked domains.
.EXAMPLE
Block-LoopSharingDomains -Identity 'container-id' -Domains 'contoso.com','fabrikam.com'
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

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ SharingDomainRestrictionMode = 'BlockList'; SharingBlockedDomainList = $Domains -join " " } -ActionDescription 'Block Loop sharing for specified domains'
}
