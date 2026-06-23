function Clear-LoopAccessControlGroups {
<#!
.SYNOPSIS
Clears all restricted access control groups from a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Clear-LoopAccessControlGroups -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ ClearRestrictedAccessControl = $true } -ActionDescription 'Clear Loop restricted access control groups'
}
