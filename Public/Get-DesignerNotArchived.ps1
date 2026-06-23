function Get-DesignerNotArchived {
<#
.SYNOPSIS
Gets non-archived Designer containers.
.DESCRIPTION
Returns Designer containers that are not archived.
.PARAMETER Identity
Optional container identity to retrieve a single non-archived Designer container.
.EXAMPLE
Get-DesignerNotArchived
.EXAMPLE
Get-DesignerNotArchived -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-DesignerIdentityProvided -Identity $Identity) {
        $container = Get-DesignerContainerBase -Identity $Identity
        if ($null -eq $container) {
            return
        }

        if ($container.Status -in @('Archived','RecentlyArchived','FullyArchived','Reactivating')) {
            return
        }

        return $container
    }

    Get-DesignerContainerBase | Where-Object { $_.Status -notin @('Archived','RecentlyArchived','FullyArchived','Reactivating') }
}
