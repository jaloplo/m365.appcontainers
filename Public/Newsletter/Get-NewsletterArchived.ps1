function Get-NewsletterArchived {
<#
.SYNOPSIS
Gets archived Newsletter containers.
.DESCRIPTION
Returns Newsletter containers whose ArchiveState is Archived.
.PARAMETER Identity
Optional container identity to retrieve a single archived Newsletter container.
.EXAMPLE
Get-NewsletterArchived
.EXAMPLE
Get-NewsletterArchived -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-NewsletterIdentityProvided -Identity $Identity) {
        Get-NewsletterContainerBase -Identity $Identity -ArchiveStates @('Archived')
        return
    }

    Get-NewsletterContainerBase -ArchiveStates @('Archived')
}
