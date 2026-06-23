function Invoke-LoopContainerUpdate {
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

    $container = Get-LoopContainerBase -Identity $Identity
    if ($null -eq $container) {
        throw "Loop container '$Identity' was not found."
    }

    if ($PSCmdlet.ShouldProcess($Identity, $ActionDescription)) {
        $parameters = @{ Identity = $Identity }
        foreach ($key in $Settings.Keys) {
            $parameters[$key] = $Settings[$key]
        }

        Set-SPOContainer @parameters
    }
}
