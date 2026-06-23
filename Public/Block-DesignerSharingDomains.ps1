function Block-DesignerSharingDomains {
<#!
.SYNOPSIS
Blocks sharing with the specified domains for a Designer container.
.PARAMETER Identity
The container identity.
.PARAMETER Domains
The list of blocked domains.
.EXAMPLE
Block-DesignerSharingDomains -Identity 'container-id' -Domains 'contoso.com','fabrikam.com'
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

    Invoke-DesignerContainerUpdate -Identity $Identity -Settings @{ SharingDomainRestrictionMode = 'BlockList'; SharingBlockedDomainList = $Domains -join " " } -ActionDescription 'Block Designer sharing for specified domains'
}
