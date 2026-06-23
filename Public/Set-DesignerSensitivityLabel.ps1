function Set-DesignerSensitivityLabel {
<#!
.SYNOPSIS
Sets a sensitivity label for a Designer container.
.PARAMETER Identity
The container identity.
.PARAMETER SensitivityLabel
The label GUID or name.
.EXAMPLE
Set-DesignerSensitivityLabel -Identity 'container-id' -SensitivityLabel 'label-guid-or-name'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$SensitivityLabel
    )

    Invoke-DesignerContainerUpdate -Identity $Identity -Settings @{ SensitivityLabel = $SensitivityLabel } -ActionDescription 'Set Designer sensitivity label'
}
