function Get-Designer {
<#
.SYNOPSIS
Gets Designer containers.
.DESCRIPTION
Returns SharePoint Online container objects where OwningApplicationName equals Designer. If Identity is provided, retrieves that specific container by using Get-SPOContainer -Identity.
.PARAMETER Identity
Optional container identity to retrieve a single Designer container.
.EXAMPLE
Get-Designer
.EXAMPLE
Get-Designer -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-DesignerIdentityProvided -Identity $Identity) {
        Get-DesignerContainerBase -Identity $Identity
        return
    }

    Get-DesignerContainerBase
}
