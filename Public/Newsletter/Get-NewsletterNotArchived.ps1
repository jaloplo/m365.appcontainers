function Get-NewsletterNotArchived {
<#
.SYNOPSIS
Gets non-archived Newsletter containers.
.DESCRIPTION
Returns Newsletter containers that are not archived.
.PARAMETER Identity
Optional container identity to retrieve a single non-archived Newsletter container.
.EXAMPLE
Get-NewsletterNotArchived
.EXAMPLE
Get-NewsletterNotArchived -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-NewsletterIdentityProvided -Identity $Identity) {
        $container = Get-NewsletterContainerBase -Identity $Identity
        if ($null -eq $container) {
            return
        }

        if ($container.Status -in @('Archived','RecentlyArchived','FullyArchived','Reactivating')) {
            return
        }

        return $container
    }

    Get-NewsletterContainerBase | Where-Object { $_.Status -notin @('Archived','RecentlyArchived','FullyArchived','Reactivating') }
}
