function Disable-LoopAccessControl {
<#!
.SYNOPSIS
Disables restricted access control for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Disable-LoopAccessControl -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ EnableRestrictedAccessControl = $false } -ActionDescription 'Disable Loop restricted access control'
}
