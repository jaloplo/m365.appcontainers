function Enable-LoopAccessControl {
<#!
.SYNOPSIS
Enables restricted access control for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Enable-LoopAccessControl -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ EnableRestrictedAccessControl = $true } -ActionDescription 'Enable Loop restricted access control'
}
