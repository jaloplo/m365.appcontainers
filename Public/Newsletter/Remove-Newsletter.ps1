function Remove-Newsletter {
<#
.SYNOPSIS
Removes a Newsletter container.
.DESCRIPTION
Removes the specified Newsletter container by wrapping Remove-SPOContainer.
.PARAMETER Identity
The container identity to remove.
.EXAMPLE
Remove-Newsletter -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    $container = Get-NewsletterContainerBase -Identity $Identity
    if ($null -eq $container) {
        throw "Newsletter container '$Identity' was not found."
    }

    if ($PSCmdlet.ShouldProcess($Identity, 'Remove Newsletter container')) {
        Remove-SPOContainer -Identity $Identity
    }
}
