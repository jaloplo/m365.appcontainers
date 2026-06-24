function Get-NewsletterRecentlyArchived {
<#
.SYNOPSIS
Gets recently archived Newsletter containers.
.DESCRIPTION
Returns Newsletter containers whose ArchiveState is RecentlyArchived.
.PARAMETER Identity
Optional container identity to retrieve a single recently archived Newsletter container.
.EXAMPLE
Get-NewsletterRecentlyArchived
.EXAMPLE
Get-NewsletterRecentlyArchived -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-NewsletterIdentityProvided -Identity $Identity) {
        Get-NewsletterContainerBase -Identity $Identity -ArchiveStates @('RecentlyArchived')
        return
    }

    Get-NewsletterContainerBase -ArchiveStates @('RecentlyArchived')
}
