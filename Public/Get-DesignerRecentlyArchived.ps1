function Get-DesignerRecentlyArchived {
<#
.SYNOPSIS
Gets recently archived Designer containers.
.DESCRIPTION
Returns Designer containers whose ArchiveState is RecentlyArchived.
.PARAMETER Identity
Optional container identity to retrieve a single recently archived Designer container.
.EXAMPLE
Get-DesignerRecentlyArchived
.EXAMPLE
Get-DesignerRecentlyArchived -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-DesignerIdentityProvided -Identity $Identity) {
        Get-DesignerContainerBase -Identity $Identity -ArchiveStates @('RecentlyArchived')
        return
    }

    Get-DesignerContainerBase -ArchiveStates @('RecentlyArchived')
}
