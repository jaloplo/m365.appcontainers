function Get-Newsletter {
<#
.SYNOPSIS
Gets Newsletter containers.
.DESCRIPTION
Returns SharePoint Online container objects where OwningApplicationName equals Outlook Newsletter. If Identity is provided, retrieves that specific container by using Get-SPOContainer -Identity.
.PARAMETER Identity
Optional container identity to retrieve a single Newsletter container.
.EXAMPLE
Get-Newsletter
.EXAMPLE
Get-Newsletter -Identity 'container-id'
#>
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    if (Test-NewsletterIdentityProvided -Identity $Identity) {
        Get-NewsletterContainerBase -Identity $Identity
        return
    }

    Get-NewsletterContainerBase
}
