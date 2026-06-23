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
