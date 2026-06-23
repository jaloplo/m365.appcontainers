function Get-LoopContainerSetting {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string[]]$PropertyNames,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$DisplayName
    )

    $container = Get-LoopContainerBase -Identity $Identity
    if ($null -eq $container) {
        throw "Loop container '$Identity' was not found."
    }

    $result = [ordered]@{
        Identity = $Identity
        Setting = $DisplayName
    }

    foreach ($propertyName in $PropertyNames) {
        if ($container.PSObject.Properties.Name -contains $propertyName) {
            $result[$propertyName] = $container.$propertyName
        }
    }

    if ($result.Count -le 2) {
        $result['Value'] = $null
    }

    [pscustomobject]$result
}
