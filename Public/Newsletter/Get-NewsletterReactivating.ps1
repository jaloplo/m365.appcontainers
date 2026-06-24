function Get-NewsletterReactivating {
<#
.SYNOPSIS
Gets reactivating Newsletter containers.
.DESCRIPTION
Returns Newsletter containers whose ArchiveState is Reactivating.
.PARAMETER Identity
Optional container identity to retrieve a single reactivating Newsletter container.
.EXAMPLE
Get-NewsletterReactivating
.EXAMPLE
Get-NewsletterReactivating -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-NewsletterIdentityProvided -Identity $Identity) {
        Get-NewsletterContainerBase -Identity $Identity -ArchiveStates @('Reactivating')
        return
    }

    Get-NewsletterContainerBase -ArchiveStates @('Reactivating')
}
