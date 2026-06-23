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
