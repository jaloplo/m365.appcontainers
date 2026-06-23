function Set-LoopSensitivityLabel {
<#!
.SYNOPSIS
Sets a sensitivity label for a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER SensitivityLabel
The label GUID or name.
.EXAMPLE
Set-LoopSensitivityLabel -Identity 'container-id' -SensitivityLabel 'label-guid-or-name'
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

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ SensitivityLabel = $SensitivityLabel } -ActionDescription 'Set Loop sensitivity label'
}
