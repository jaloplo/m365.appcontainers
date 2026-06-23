function Clear-DesignerAccessControlGroups {
<#
.SYNOPSIS
Clears all restricted access control groups from a Designer container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Clear-DesignerAccessControlGroups -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-DesignerContainerUpdate -Identity $Identity -Settings @{ ClearRestrictedAccessControl = $true } -ActionDescription 'Clear Designer restricted access control groups'
}
