function Get-DesignerSensitivityLabel {
<#!
.SYNOPSIS
Gets the configured sensitivity label for a Designer container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Get-DesignerSensitivityLabel -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Get-DesignerContainerSetting -Identity $Identity -PropertyNames @('SensitivityLabel','SensitivityLabelId','LabelId') -DisplayName 'SensitivityLabel'
}
