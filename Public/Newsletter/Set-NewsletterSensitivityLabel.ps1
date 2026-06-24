function Set-NewsletterSensitivityLabel {
<#!
.SYNOPSIS
Sets a sensitivity label for a Newsletter container.
.PARAMETER Identity
The container identity.
.PARAMETER SensitivityLabel
The label GUID or name.
.EXAMPLE
Set-NewsletterSensitivityLabel -Identity 'container-id' -SensitivityLabel 'label-guid-or-name'
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

    Invoke-NewsletterContainerUpdate -Identity $Identity -Settings @{ SensitivityLabel = $SensitivityLabel } -ActionDescription 'Set Newsletter sensitivity label'
}
