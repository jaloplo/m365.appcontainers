function Get-DesignerPrincipalOwner {
<#!
.SYNOPSIS
Gets the current principal owner metadata for a Designer container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Get-DesignerPrincipalOwner -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    $container = Get-DesignerContainerBase -Identity $Identity
    if ($null -eq $container) {
        throw "Designer container '$Identity' was not found."
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
