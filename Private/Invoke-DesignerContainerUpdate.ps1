function Invoke-DesignerContainerUpdate {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity,

        [Parameter(Mandatory = $true)]
        [hashtable]$Settings,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$ActionDescription
    )

    $container = Get-DesignerContainerBase -Identity $Identity
    if ($null -eq $container) {
        throw "Designer container '$Identity' was not found."
    }

    if ($PSCmdlet.ShouldProcess($Identity, $ActionDescription)) {
        $parameters = @{ Identity = $Identity }
        foreach ($key in $Settings.Keys) {
            $parameters[$key] = $Settings[$key]
        }

        Set-SPOContainer @parameters
    }
}
