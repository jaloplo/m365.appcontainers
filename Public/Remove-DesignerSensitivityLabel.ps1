function Remove-DesignerSensitivityLabel {
<#!
.SYNOPSIS
Removes the sensitivity label from a Designer container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Remove-DesignerSensitivityLabel -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-DesignerContainerUpdate -Identity $Identity -Settings @{ RemoveLabel = $true } -ActionDescription 'Remove Designer sensitivity label'
}
