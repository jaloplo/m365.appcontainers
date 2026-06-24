function Test-NewsletterContainer {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $Container
    )

    process {
        $Container.OwningApplicationName -eq 'Outlook Newsletters'
    }
}
