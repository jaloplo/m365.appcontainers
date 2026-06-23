function Remove-LoopAccessControlGroup {
<#!
.SYNOPSIS
Removes a group from the restricted access control list for a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER GroupIdentity
The group identifier to remove.
.EXAMPLE
Remove-LoopAccessControlGroup -Identity 'container-id' -GroupIdentity 'group-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('GroupId')]
        [string]$GroupIdentity
    )

    $container = Get-LoopContainerBase -Identity $Identity
    if ($null -eq $container) {
        throw "Loop container '$Identity' was not found."
    }

    $groups = @(Get-LoopRestrictedAccessControlGroups -Container $container)
    $updatedGroups = @($groups | Where-Object { $_ -ne $GroupIdentity })

    if ($updatedGroups.Count -eq $groups.Count) {
        return $container
    }

    if ($PSCmdlet.ShouldProcess($Identity, "Remove restricted access control group '$GroupIdentity'")) {
        Set-SPOContainer -Identity $Identity -EnableRestrictedAccessControl $true -RestrictedAccessControlGroups $updatedGroups
    }
}
