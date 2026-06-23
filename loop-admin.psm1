# Module: loop-admin
# Thin wrappers for SharePoint Online Loop container administration.

Set-StrictMode -Version Latest

function Test-LoopContainer {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $Container
    )

    process {
        $Container.OwningApplicationName -eq 'Loop'
    }
}

function Test-LoopIdentityProvided {
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    $PSBoundParameters.ContainsKey('Identity') -and -not [string]::IsNullOrWhiteSpace($Identity)
}

function Get-LoopContainerBase {
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity,

        [Parameter()]
        [string[]]$ArchiveStates
    )

    if (Test-LoopIdentityProvided -Identity $Identity) {
        $container = Get-SPOContainer -Identity $Identity

        if (-not (Test-LoopContainer -Container $container)) {
            return
        }

        if ($null -ne $ArchiveStates -and $ArchiveStates.Count -gt 0) {
            if ($container.Status -notin $ArchiveStates) {
                return
            }
        }

        return $container
    }

    $containers = Get-SPOContainer | Where-Object { (Get-SPOContainer -Identity $_.ContainerId).OwningApplicationName -eq 'Loop' }

    if ($null -ne $ArchiveStates -and $ArchiveStates.Count -gt 0) {
        $containers = $containers | Where-Object { $_.Status -in $ArchiveStates }
    }

    $containers
}

function Get-Loop {
<#
.SYNOPSIS
Gets Loop containers.
.DESCRIPTION
Returns SharePoint Online container objects where OwningApplicationName equals Loop. If Identity is provided, retrieves that specific container by using Get-SPOContainer -Identity.
.PARAMETER Identity
Optional container identity to retrieve a single Loop container.
.EXAMPLE
Get-Loop
.EXAMPLE
Get-Loop -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-LoopIdentityProvided -Identity $Identity) {
        Get-LoopContainerBase -Identity $Identity
        return
    }

    Get-LoopContainerBase
}

function Get-DeletedLoop {
<#
.SYNOPSIS
Gets deleted Loop containers.
.DESCRIPTION
Returns SharePoint Online deleted container objects where OwningApplicationName equals Loop by wrapping Get-SPODeletedContainer.
.PARAMETER Identity
Optional container identity to retrieve a single deleted Loop container.
.EXAMPLE
Get-DeletedLoop
.EXAMPLE
Get-DeletedLoop -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-LoopIdentityProvided -Identity $Identity) {
        $container = Get-SPODeletedContainer -Identity $Identity

        if ($null -eq $container) {
            return
        }

        if (-not (Test-LoopContainer -Container $container)) {
            return
        }

        return $container
    }

    Get-SPODeletedContainer | Where-Object { (Get-SPODeletedContainer -Identity $_.ContainerId).OwningApplicationName -eq 'Loop' }
}

function Get-LoopArchived {
<#
.SYNOPSIS
Gets archived Loop containers.
.DESCRIPTION
Returns Loop containers whose ArchiveState is Archived.
.PARAMETER Identity
Optional container identity to retrieve a single archived Loop container.
.EXAMPLE
Get-LoopArchived
.EXAMPLE
Get-LoopArchived -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-LoopIdentityProvided -Identity $Identity) {
        Get-LoopContainerBase -Identity $Identity -ArchiveStates @('Archived')
        return
    }

    Get-LoopContainerBase -ArchiveStates @('Archived')
}

function Get-LoopRecentlyArchived {
<#
.SYNOPSIS
Gets recently archived Loop containers.
.DESCRIPTION
Returns Loop containers whose ArchiveState is RecentlyArchived.
.PARAMETER Identity
Optional container identity to retrieve a single recently archived Loop container.
.EXAMPLE
Get-LoopRecentlyArchived
.EXAMPLE
Get-LoopRecentlyArchived -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-LoopIdentityProvided -Identity $Identity) {
        Get-LoopContainerBase -Identity $Identity -ArchiveStates @('RecentlyArchived')
        return
    }

    Get-LoopContainerBase -ArchiveStates @('RecentlyArchived')
}

function Get-LoopFullyArchived {
<#
.SYNOPSIS
Gets fully archived Loop containers.
.DESCRIPTION
Returns Loop containers whose ArchiveState is FullyArchived.
.PARAMETER Identity
Optional container identity to retrieve a single fully archived Loop container.
.EXAMPLE
Get-LoopFullyArchived
.EXAMPLE
Get-LoopFullyArchived -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-LoopIdentityProvided -Identity $Identity) {
        Get-LoopContainerBase -Identity $Identity -ArchiveStates @('FullyArchived')
        return
    }

    Get-LoopContainerBase -ArchiveStates @('FullyArchived')
}

function Get-LoopReactivating {
<#
.SYNOPSIS
Gets reactivating Loop containers.
.DESCRIPTION
Returns Loop containers whose ArchiveState is Reactivating.
.PARAMETER Identity
Optional container identity to retrieve a single reactivating Loop container.
.EXAMPLE
Get-LoopReactivating
.EXAMPLE
Get-LoopReactivating -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-LoopIdentityProvided -Identity $Identity) {
        Get-LoopContainerBase -Identity $Identity -ArchiveStates @('Reactivating')
        return
    }

    Get-LoopContainerBase -ArchiveStates @('Reactivating')
}

function Get-LoopNotArchived {
<#
.SYNOPSIS
Gets non-archived Loop containers.
.DESCRIPTION
Returns Loop containers that are not archived.
.PARAMETER Identity
Optional container identity to retrieve a single non-archived Loop container.
.EXAMPLE
Get-LoopNotArchived
.EXAMPLE
Get-LoopNotArchived -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-LoopIdentityProvided -Identity $Identity) {
        $container = Get-LoopContainerBase -Identity $Identity
        if ($null -eq $container) {
            return
        }

        if ($container.Status -in @('Archived','RecentlyArchived','FullyArchived','Reactivating')) {
            return
        }

        return $container
    }

    Get-LoopContainerBase | Where-Object { $_.Status -notin @('Archived','RecentlyArchived','FullyArchived','Reactivating') }
}

function Remove-Loop {
<#
.SYNOPSIS
Removes a Loop container.
.DESCRIPTION
Removes the specified Loop container by wrapping Remove-SPOContainer.
.PARAMETER Identity
The container identity to remove.
.EXAMPLE
Remove-Loop -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    $container = Get-LoopContainerBase -Identity $Identity
    if ($null -eq $container) {
        throw "Loop container '$Identity' was not found."
    }

    if ($PSCmdlet.ShouldProcess($Identity, 'Remove Loop container')) {
        Remove-SPOContainer -Identity $Identity
    }
}

function Invoke-LoopUserCommand {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Owner','Reader','Writer','Manager')]
        [string]$Role,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Add','Set','Remove')]
        [string]$Action,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$User
    )

    $container = Get-LoopContainerBase -Identity $Identity
    if ($null -eq $container) {
        throw "Loop container '$Identity' was not found."
    }

    switch ($Action) {
        'Add' { return Add-SPOContainerUser -ContainerId $Identity -LoginName $User -Role $Role }
        'Set' { return Set-SPOContainerUser -ContainerId $Identity -LoginName $User -Role $Role }
        'Remove' { return Remove-SPOContainerUser -ContainerId $Identity -LoginName $User -Role $Role }
    }
}

function Invoke-LoopContainerUpdate {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity,

        [Parameter(Mandatory = $true)]
        [hashtable]$Settings,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$ActionDescription
    )

    $container = Get-LoopContainerBase -Identity $Identity
    if ($null -eq $container) {
        throw "Loop container '$Identity' was not found."
    }

    if ($PSCmdlet.ShouldProcess($Identity, $ActionDescription)) {
        $parameters = @{ Identity = $Identity }
        foreach ($key in $Settings.Keys) {
            $parameters[$key] = $Settings[$key]
        }

        Set-SPOContainer @parameters
    }
}

function Get-LoopRestrictedAccessControlGroups {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        $Container
    )

    $candidateProperties = @(
        'RestrictedAccessControlGroups',
        'RestrictedAccessControlGroupIds',
        'RestrictedAccessControl',
        'RestrictedAccessControlEntries'
    )

    foreach ($propertyName in $candidateProperties) {
        if ($Container.PSObject.Properties.Name -contains $propertyName) {
            $value = $Container.$propertyName
            if ($null -eq $value) {
                return @()
            }

            if ($value -is [System.Array]) {
                return @($value)
            }

            return @($value)
        }
    }

    return @()
}

function Get-LoopContainerSetting {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string[]]$PropertyNames,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$DisplayName
    )

    $container = Get-LoopContainerBase -Identity $Identity
    if ($null -eq $container) {
        throw "Loop container '$Identity' was not found."
    }

    $result = [ordered]@{
        Identity = $Identity
        Setting = $DisplayName
    }

    foreach ($propertyName in $PropertyNames) {
        if ($container.PSObject.Properties.Name -contains $propertyName) {
            $result[$propertyName] = $container.$propertyName
        }
    }

    if ($result.Count -le 2) {
        $result['Value'] = $null
    }

    [pscustomobject]$result
}

function Add-LoopOwner {
<#
.SYNOPSIS
Adds an owner to a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Add-LoopOwner -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-LoopUserCommand -Action Add -Role Owner -Identity $Identity -User $User
}

function Add-LoopReader {
<#
.SYNOPSIS
Adds a reader to a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Add-LoopReader -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-LoopUserCommand -Action Add -Role Reader -Identity $Identity -User $User
}

function Add-LoopWriter {
<#
.SYNOPSIS
Adds a writer to a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Add-LoopWriter -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-LoopUserCommand -Action Add -Role Writer -Identity $Identity -User $User
}

function Add-LoopManager {
<#
.SYNOPSIS
Adds a manager to a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Add-LoopManager -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-LoopUserCommand -Action Add -Role Manager -Identity $Identity -User $User
}

function Set-LoopOwner {
<#
.SYNOPSIS
Sets a user as owner in a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Set-LoopOwner -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-LoopUserCommand -Action Set -Role Owner -Identity $Identity -User $User
}

function Set-LoopReader {
<#
.SYNOPSIS
Sets a user as reader in a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Set-LoopReader -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-LoopUserCommand -Action Set -Role Reader -Identity $Identity -User $User
}

function Set-LoopWriter {
<#
.SYNOPSIS
Sets a user as writer in a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Set-LoopWriter -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-LoopUserCommand -Action Set -Role Writer -Identity $Identity -User $User
}

function Set-LoopManager {
<#
.SYNOPSIS
Sets a user as manager in a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Set-LoopManager -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-LoopUserCommand -Action Set -Role Manager -Identity $Identity -User $User
}

function Remove-LoopOwner {
<#
.SYNOPSIS
Removes an owner from a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Remove-LoopOwner -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-LoopUserCommand -Action Remove -Role Owner -Identity $Identity -User $User
}

function Remove-LoopReader {
<#
.SYNOPSIS
Removes a reader from a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Remove-LoopReader -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-LoopUserCommand -Action Remove -Role Reader -Identity $Identity -User $User
}

function Remove-LoopWriter {
<#
.SYNOPSIS
Removes a writer from a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Remove-LoopWriter -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-LoopUserCommand -Action Remove -Role Writer -Identity $Identity -User $User
}

function Remove-LoopManager {
<#
.SYNOPSIS
Removes a manager from a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Remove-LoopManager -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-LoopUserCommand -Action Remove -Role Manager -Identity $Identity -User $User
}

function Enable-LoopOfficeDocsEdition {
<#
.SYNOPSIS
Enables Office document editing for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Enable-LoopOfficeDocsEdition -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ AllowEditing = $true } -ActionDescription 'Enable Loop Office document editing'
}

function Disable-LoopOfficeDocsEdition {
<#
.SYNOPSIS
Disables Office document editing for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Disable-LoopOfficeDocsEdition -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ AllowEditing = $false } -ActionDescription 'Disable Loop Office document editing'
}

function Block-LoopDownload {
<#
.SYNOPSIS
Blocks downloads for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Block-LoopDownload -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ BlockDownloadPolicy = $true; ExcludeBlockDownloadPolicyContainerOwners = $false } -ActionDescription 'Block Loop container downloads'
}

function Block-LoopDownloadExceptOwners {
<#
.SYNOPSIS
Blocks downloads for a Loop container except for container owners.
.PARAMETER Identity
The container identity.
.EXAMPLE
Block-LoopDownloadExceptOwners -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ BlockDownloadPolicy = $true; ExcludeBlockDownloadPolicyContainerOwners = $true } -ActionDescription 'Block Loop container downloads except for owners'
}

function Unblock-LoopDownload {
<#
.SYNOPSIS
Removes download restrictions from a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Unblock-LoopDownload -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ BlockDownloadPolicy = $false } -ActionDescription 'Unblock Loop container downloads'
}

function Enable-LoopAccessControl {
<#
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

function Disable-LoopAccessControl {
<#
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

function Add-LoopAccessControlGroup {
<#
.SYNOPSIS
Adds a group to the restricted access control list for a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER GroupIdentity
The group identifier to add.
.EXAMPLE
Add-LoopAccessControlGroup -Identity 'container-id' -GroupIdentity 'group-id'
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
    if ($GroupIdentity -in $groups) {
        return $container
    }

    $updatedGroups = @($groups + $GroupIdentity)

    if ($PSCmdlet.ShouldProcess($Identity, "Add restricted access control group '$GroupIdentity'")) {
        Set-SPOContainer -Identity $Identity -EnableRestrictedAccessControl $true -RestrictedAccessControlGroups $updatedGroups
    }
}

function Remove-LoopAccessControlGroup {
<#
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

function Clear-LoopAccessControlGroups {
<#
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

function Get-LoopPrincipalOwner {
<#
.SYNOPSIS
Gets the current principal owner metadata for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Get-LoopPrincipalOwner -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    $container = Get-LoopContainerBase -Identity $Identity
    if ($null -eq $container) {
        throw "Loop container '$Identity' was not found."
    }

    $candidateProperties = @(
        'PrincipalOwner',
        'CurrentPrincipalOwner',
        'PrincipalOwnerMetadata'
    )

    foreach ($propertyName in $candidateProperties) {
        if ($container.PSObject.Properties.Name -contains $propertyName) {
            return $container.$propertyName
        }
    }

    return $container | Select-Object -Property *Owner*
}

function Disable-LoopTenantSearch {
<#
.SYNOPSIS
Restricts tenant-wide search visibility for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Disable-LoopTenantSearch -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ RestrictContentOrgWideSearch = $true } -ActionDescription 'Disable Loop tenant search visibility'
}

function Enable-LoopTenantSearch {
<#
.SYNOPSIS
Enables tenant-wide search visibility for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Enable-LoopTenantSearch -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ RestrictContentOrgWideSearch = $false } -ActionDescription 'Enable Loop tenant search visibility'
}

function Get-LoopTenantSearch {
<#
.SYNOPSIS
Gets the current tenant search configuration for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Get-LoopTenantSearch -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Get-LoopContainerSetting -Identity $Identity -PropertyNames @('RestrictContentOrgWideSearch') -DisplayName 'TenantSearch'
}

function Set-LoopSensitivityLabel {
<#
.SYNOPSIS
Sets a sensitivity label for a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER SensitivityLabel
The label GUID or name.
.EXAMPLE
Set-LoopSensitivityLabel -Identity 'container-id' -SensitivityLabel 'label-guid-or-name'
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

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ SensitivityLabel = $SensitivityLabel } -ActionDescription 'Set Loop sensitivity label'
}

function Get-LoopSensitivityLabel {
<#
.SYNOPSIS
Gets the configured sensitivity label for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Get-LoopSensitivityLabel -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Get-LoopContainerSetting -Identity $Identity -PropertyNames @('SensitivityLabel','SensitivityLabelId','LabelId') -DisplayName 'SensitivityLabel'
}

function Remove-LoopSensitivityLabel {
<#
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

function Allow-LoopSharingDomains {
<#
.SYNOPSIS
Allows sharing only with the specified domains for a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER Domains
The list of allowed domains.
.EXAMPLE
Allow-LoopSharingDomains -Identity 'container-id' -Domains 'contoso.com','fabrikam.com'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string[]]$Domains
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ SharingDomainRestrictionMode = 'AllowList'; SharingAllowedDomainList = $Domains -join " " } -ActionDescription 'Allow Loop sharing only for specified domains'
}

function Block-LoopSharingDomains {
<#
.SYNOPSIS
Blocks sharing with the specified domains for a Loop container.
.PARAMETER Identity
The container identity.
.PARAMETER Domains
The list of blocked domains.
.EXAMPLE
Block-LoopSharingDomains -Identity 'container-id' -Domains 'contoso.com','fabrikam.com'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string[]]$Domains
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ SharingDomainRestrictionMode = 'BlockList'; SharingBlockedDomainList = $Domains -join " " } -ActionDescription 'Block Loop sharing for specified domains'
}

function Get-LoopSharingDomains {
<#
.SYNOPSIS
Gets the current sharing domain configuration for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Get-LoopSharingDomains -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Get-LoopContainerSetting -Identity $Identity -PropertyNames @('SharingDomainRestrictionMode','SharingAllowedDomainList','SharingBlockedDomainList') -DisplayName 'SharingDomains'
}

function Disable-LoopSharingDomains {
<#
.SYNOPSIS
Removes sharing domain restrictions from a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Disable-LoopSharingDomains -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ SharingDomainRestrictionMode = 'None'; SharingAllowedDomainList = ""; SharingBlockedDomainList = "" } -ActionDescription 'Disable Loop sharing domain restrictions'
}

Export-ModuleMember -Function @(
    'Get-Loop',
    'Get-DeletedLoop',
    'Get-LoopArchived',
    'Get-LoopRecentlyArchived',
    'Get-LoopFullyArchived',
    'Get-LoopReactivating',
    'Get-LoopNotArchived',
    'Remove-Loop',
    'Add-LoopOwner',
    'Add-LoopReader',
    'Add-LoopWriter',
    'Add-LoopManager',
    'Set-LoopOwner',
    'Set-LoopReader',
    'Set-LoopWriter',
    'Set-LoopManager',
    'Remove-LoopOwner',
    'Remove-LoopReader',
    'Remove-LoopWriter',
    'Remove-LoopManager',
    'Enable-LoopOfficeDocsEdition', # check
    'Disable-LoopOfficeDocsEdition', # check
    'Block-LoopDownload',
    'Block-LoopDownloadExceptOwners',
    'Unblock-LoopDownload',
    'Enable-LoopAccessControl', # check
    'Disable-LoopAccessControl', # check
    'Add-LoopAccessControlGroup', # check
    'Remove-LoopAccessControlGroup', # check
    'Clear-LoopAccessControlGroups', # check
    'Get-LoopPrincipalOwner',
    'Disable-LoopTenantSearch',
    'Enable-LoopTenantSearch',
    'Get-LoopTenantSearch',
    'Set-LoopSensitivityLabel',
    'Get-LoopSensitivityLabel',
    'Remove-LoopSensitivityLabel',
    'Allow-LoopSharingDomains',
    'Block-LoopSharingDomains',
    'Get-LoopSharingDomains',
    'Disable-LoopSharingDomains'
)
