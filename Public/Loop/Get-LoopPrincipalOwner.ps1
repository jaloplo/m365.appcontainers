function Get-LoopPrincipalOwner {
<#!
.SYNOPSIS
Gets the current principal owner metadata for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Get-LoopPrincipalOwner -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    $container = Get-LoopContainerBase -Identity $Identity
    if ($null -eq $container) {
        throw "Loop container '$Identity' was not found."
    }

    $candidateProperties = @(
        'PrincipalOwner',
        'CurrentPrincipalOwner',
        'PrincipalOwnerMetadata'
    )

    foreach ($propertyName in $candidateProperties) {
        if ($container.PSObject.Properties.Name -contains $propertyName) {
            return $container.$propertyName
        }
    }

    return $container | Select-Object -Property *Owner*
}
