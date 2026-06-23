function Enable-DesignerAccessControl {
<#
.SYNOPSIS
Enables restricted access control for a Designer container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Enable-DesignerAccessControl -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-DesignerContainerUpdate -Identity $Identity -Settings @{ EnableRestrictedAccessControl = $true } -ActionDescription 'Enable Designer restricted access control'
}
