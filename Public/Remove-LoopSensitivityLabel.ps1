function Remove-LoopSensitivityLabel {
<#!
.SYNOPSIS
Removes the sensitivity label from a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Remove-LoopSensitivityLabel -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ RemoveLabel = $true } -ActionDescription 'Remove Loop sensitivity label'
}
