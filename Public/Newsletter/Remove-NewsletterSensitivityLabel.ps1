function Remove-NewsletterSensitivityLabel {
<#!
.SYNOPSIS
Removes the sensitivity label from a Newsletter container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Remove-NewsletterSensitivityLabel -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-NewsletterContainerUpdate -Identity $Identity -Settings @{ RemoveLabel = $true } -ActionDescription 'Remove Newsletter sensitivity label'
}
