function Test-LoopContainer {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $Container
    )

    process {
        $Container.OwningApplicationName -eq 'Loop'
    }
}
