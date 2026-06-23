function Get-DesignerReactivating {
<#
.SYNOPSIS
Gets reactivating Designer containers.
.DESCRIPTION
Returns Designer containers whose ArchiveState is Reactivating.
.PARAMETER Identity
Optional container identity to retrieve a single reactivating Designer container.
.EXAMPLE
Get-DesignerReactivating
.EXAMPLE
Get-DesignerReactivating -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-DesignerIdentityProvided -Identity $Identity) {
        Get-DesignerContainerBase -Identity $Identity -ArchiveStates @('Reactivating')
        return
    }

    Get-DesignerContainerBase -ArchiveStates @('Reactivating')
}
