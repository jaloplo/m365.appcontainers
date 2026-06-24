function Get-NewsletterSensitivityLabel {
<#!
.SYNOPSIS
Gets the configured sensitivity label for a Newsletter container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Get-NewsletterSensitivityLabel -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Get-NewsletterContainerSetting -Identity $Identity -PropertyNames @('SensitivityLabel','SensitivityLabelId','LabelId') -DisplayName 'SensitivityLabel'
}
