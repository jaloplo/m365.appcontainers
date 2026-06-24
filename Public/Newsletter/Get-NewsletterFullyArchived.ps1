function Get-NewsletterFullyArchived {
<#
.SYNOPSIS
Gets fully archived Newsletter containers.
.DESCRIPTION
Returns Newsletter containers whose ArchiveState is FullyArchived.
.PARAMETER Identity
Optional container identity to retrieve a single fully archived Newsletter container.
.EXAMPLE
Get-NewsletterFullyArchived
.EXAMPLE
Get-NewsletterFullyArchived -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-NewsletterIdentityProvided -Identity $Identity) {
        Get-NewsletterContainerBase -Identity $Identity -ArchiveStates @('FullyArchived')
        return
    }

    Get-NewsletterContainerBase -ArchiveStates @('FullyArchived')
}
