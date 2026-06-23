function Get-LoopSensitivityLabel {
<#!
.SYNOPSIS
Gets the configured sensitivity label for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Get-LoopSensitivityLabel -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Get-LoopContainerSetting -Identity $Identity -PropertyNames @('SensitivityLabel','SensitivityLabelId','LabelId') -DisplayName 'SensitivityLabel'
}
