function Get-DeletedLoop {
<#
.SYNOPSIS
Gets deleted Loop containers.
.DESCRIPTION
Returns SharePoint Online deleted container objects where OwningApplicationName equals Loop by wrapping Get-SPODeletedContainer.
.PARAMETER Identity
Optional container identity to retrieve a single deleted Loop container.
.EXAMPLE
Get-DeletedLoop
.EXAMPLE
Get-DeletedLoop -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-LoopIdentityProvided -Identity $Identity) {
        $container = Get-SPODeletedContainer -Identity $Identity

        if ($null -eq $container) {
            return
        }

        if (-not (Test-LoopContainer -Container $container)) {
            return
        }

        return $container
    }

    Get-SPODeletedContainer | Where-Object { (Get-SPODeletedContainer -Identity $_.ContainerId).OwningApplicationName -eq 'Loop' }
}
