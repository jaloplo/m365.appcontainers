function Get-Loop {
<#
.SYNOPSIS
Gets Loop containers.
.DESCRIPTION
Returns SharePoint Online container objects where OwningApplicationName equals Loop. If Identity is provided, retrieves that specific container by using Get-SPOContainer -Identity.
.PARAMETER Identity
Optional container identity to retrieve a single Loop container.
.EXAMPLE
Get-Loop
.EXAMPLE
Get-Loop -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-LoopIdentityProvided -Identity $Identity) {
        Get-LoopContainerBase -Identity $Identity
        return
    }

    Get-LoopContainerBase
}
