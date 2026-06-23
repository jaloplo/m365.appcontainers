function Get-LoopRestrictedAccessControlGroups {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        $Container
    )

    $candidateProperties = @(
        'RestrictedAccessControlGroups',
        'RestrictedAccessControlGroupIds',
        'RestrictedAccessControl',
        'RestrictedAccessControlEntries'
    )

    foreach ($propertyName in $candidateProperties) {
        if ($Container.PSObject.Properties.Name -contains $propertyName) {
            $value = $Container.$propertyName
            if ($null -eq $value) {
                return @()
            }

            if ($value -is [System.Array]) {
                return @($value)
            }

            return @($value)
        }
    }

    return @()
}
