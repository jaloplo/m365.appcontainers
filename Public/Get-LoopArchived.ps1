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
