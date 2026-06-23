function Disable-DesignerAccessControl {
<#
.SYNOPSIS
Disables restricted access control for a Designer container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Disable-DesignerAccessControl -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-DesignerContainerUpdate -Identity $Identity -Settings @{ EnableRestrictedAccessControl = $false } -ActionDescription 'Disable Designer restricted access control'
}
