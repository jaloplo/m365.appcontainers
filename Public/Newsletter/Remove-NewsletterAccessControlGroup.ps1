function Remove-NewsletterAccessControlGroup {
<#!
.SYNOPSIS
Removes a group from the restricted access control list for a Newsletter container.
.PARAMETER Identity
The container identity.
.PARAMETER GroupIdentity
The group identifier to remove.
.EXAMPLE
Remove-NewsletterAccessControlGroup -Identity 'container-id' -GroupIdentity 'group-id'
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

    $container = Get-NewsletterContainerBase -Identity $Identity
    if ($null -eq $container) {
        throw "Newsletter container '$Identity' was not found."
    }

    $groups = @(Get-NewsletterRestrictedAccessControlGroups -Container $container)
    $updatedGroups = @($groups | Where-Object { $_ -ne $GroupIdentity })

    if ($updatedGroups.Count -eq $groups.Count) {
        return $container
    }

    if ($PSCmdlet.ShouldProcess($Identity, "Remove restricted access control group '$GroupIdentity'")) {
        Set-SPOContainer -Identity $Identity -EnableRestrictedAccessControl $true -RestrictedAccessControlGroups $updatedGroups
    }
}
