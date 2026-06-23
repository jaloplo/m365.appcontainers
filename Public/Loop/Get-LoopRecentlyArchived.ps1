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
