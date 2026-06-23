function Test-DesignerContainer {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $Container
    )

    process {
        $Container.OwningApplicationName -eq 'Designer'
    }
}
