function Allow-DesignerSharingDomains {
<#!
.SYNOPSIS
Allows sharing only with the specified domains for a Designer container.
.PARAMETER Identity
The container identity.
.PARAMETER Domains
The list of allowed domains.
.EXAMPLE
Allow-DesignerSharingDomains -Identity 'container-id' -Domains 'contoso.com','fabrikam.com'
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

    Invoke-DesignerContainerUpdate -Identity $Identity -Settings @{ SharingDomainRestrictionMode = 'AllowList'; SharingAllowedDomainList = $Domains -join " " } -ActionDescription 'Allow Designer sharing only for specified domains'
}
