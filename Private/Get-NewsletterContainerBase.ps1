function Get-NewsletterContainerBase {
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity,

        [Parameter()]
        [string[]]$ArchiveStates
    )

    if (Test-NewsletterIdentityProvided -Identity $Identity) {
        $container = Get-SPOContainer -Identity $Identity

        if (-not (Test-NewsletterContainer -Container $container)) {
            return
        }

        if ($null -ne $ArchiveStates -and $ArchiveStates.Count -gt 0) {
            if ($container.Status -notin $ArchiveStates) {
                return
            }
        }

        return $container
    }

    $containers = Get-SPOContainer | Where-Object { (Get-SPOContainer -Identity $_.ContainerId).OwningApplicationName -eq 'Outlook Newsletters' }

    if ($null -ne $ArchiveStates -and $ArchiveStates.Count -gt 0) {
        $containers = $containers | Where-Object { $_.Status -in $ArchiveStates }
    }

    $containers
}
