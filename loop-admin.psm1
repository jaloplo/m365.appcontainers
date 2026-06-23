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

    Get-SPODeletedContainer | Where-Object { $_.OwningApplicationName -eq 'Loop' }
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
    'Remove-LoopManager'
)
