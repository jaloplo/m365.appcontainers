function Get-DeletedDesigner {
<##
.SYNOPSIS
Gets deleted Designer containers.
.DESCRIPTION
Returns SharePoint Online deleted container objects where OwningApplicationName equals Designer by wrapping Get-SPODeletedContainer.
.PARAMETER Identity
Optional container identity to retrieve a single deleted Designer container.
.EXAMPLE
Get-DeletedDesigner
.EXAMPLE
Get-DeletedDesigner -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-DesignerIdentityProvided -Identity $Identity) {
        $container = Get-SPODeletedContainer -Identity $Identity

        if ($null -eq $container) {
            return
        }

        if (-not (Test-DesignerContainer -Container $container)) {
            return
        }

        return $container
    }

    Get-SPODeletedContainer | Where-Object { (Get-SPODeletedContainer -Identity $_.ContainerId).OwningApplicationName -eq 'Designer' }
}
