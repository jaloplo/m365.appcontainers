function Get-DesignerArchived {
<#
.SYNOPSIS
Gets archived Designer containers.
.DESCRIPTION
Returns Designer containers whose ArchiveState is Archived.
.PARAMETER Identity
Optional container identity to retrieve a single archived Designer container.
.EXAMPLE
Get-DesignerArchived
.EXAMPLE
Get-DesignerArchived -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-DesignerIdentityProvided -Identity $Identity) {
        Get-DesignerContainerBase -Identity $Identity -ArchiveStates @('Archived')
        return
    }

    Get-DesignerContainerBase -ArchiveStates @('Archived')
}
