function Get-DesignerFullyArchived {
<#
.SYNOPSIS
Gets fully archived Designer containers.
.DESCRIPTION
Returns Designer containers whose ArchiveState is FullyArchived.
.PARAMETER Identity
Optional container identity to retrieve a single fully archived Designer container.
.EXAMPLE
Get-DesignerFullyArchived
.EXAMPLE
Get-DesignerFullyArchived -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-DesignerIdentityProvided -Identity $Identity) {
        Get-DesignerContainerBase -Identity $Identity -ArchiveStates @('FullyArchived')
        return
    }

    Get-DesignerContainerBase -ArchiveStates @('FullyArchived')
}
