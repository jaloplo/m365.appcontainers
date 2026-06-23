function Get-LoopNotArchived {
<#
.SYNOPSIS
Gets non-archived Loop containers.
.DESCRIPTION
Returns Loop containers that are not archived.
.PARAMETER Identity
Optional container identity to retrieve a single non-archived Loop container.
.EXAMPLE
Get-LoopNotArchived
.EXAMPLE
Get-LoopNotArchived -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-LoopIdentityProvided -Identity $Identity) {
        $container = Get-LoopContainerBase -Identity $Identity
        if ($null -eq $container) {
            return
        }

        if ($container.Status -in @('Archived','RecentlyArchived','FullyArchived','Reactivating')) {
            return
        }

        return $container
    }

    Get-LoopContainerBase | Where-Object { $_.Status -notin @('Archived','RecentlyArchived','FullyArchived','Reactivating') }
}
