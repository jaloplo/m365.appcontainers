function Add-NewsletterAccessControlGroup {
<#!
.SYNOPSIS
Adds a group to the restricted access control list for a Newsletter container.
.PARAMETER Identity
The container identity.
.PARAMETER GroupIdentity
The group identifier to add.
.EXAMPLE
Add-NewsletterAccessControlGroup -Identity 'container-id' -GroupIdentity 'group-id'
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
    if ($GroupIdentity -in $groups) {
        return $container
    }

    $updatedGroups = @($groups + $GroupIdentity)

    if ($PSCmdlet.ShouldProcess($Identity, "Add restricted access control group '$GroupIdentity'")) {
        Set-SPOContainer -Identity $Identity -RestrictedAccessControlGroupsToAdd $updatedGroups
    }
}
