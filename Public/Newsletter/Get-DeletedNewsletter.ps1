function Get-DeletedNewsletter {
<#
.SYNOPSIS
Gets deleted Newsletter containers.
.DESCRIPTION
Returns SharePoint Online deleted container objects where OwningApplicationName equals Newsletter by wrapping Get-SPODeletedContainer.
.PARAMETER Identity
Optional container identity to retrieve a single deleted Newsletter container.
.EXAMPLE
Get-DeletedNewsletter
.EXAMPLE
Get-DeletedNewsletter -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-NewsletterIdentityProvided -Identity $Identity) {
        $container = Get-SPODeletedContainer -Identity $Identity

        if ($null -eq $container) {
            return
        }

        if (-not (Test-NewsletterContainer -Container $container)) {
            return
        }

        return $container
    }

    Get-SPODeletedContainer | Where-Object { (Get-SPODeletedContainer -Identity $_.ContainerId).OwningApplicationName -eq 'Newsletter' }
}
