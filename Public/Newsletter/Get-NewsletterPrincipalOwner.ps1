function Get-NewsletterPrincipalOwner {
<#!
.SYNOPSIS
Gets the current principal owner metadata for a Newsletter container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Get-NewsletterPrincipalOwner -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    $container = Get-NewsletterContainerBase -Identity $Identity
    if ($null -eq $container) {
        throw "Newsletter container '$Identity' was not found."
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
