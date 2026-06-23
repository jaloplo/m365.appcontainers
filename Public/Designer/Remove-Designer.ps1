function Remove-Designer {
<#
.SYNOPSIS
Removes a Designer container.
.DESCRIPTION
Removes the specified Designer container by wrapping Remove-SPOContainer.
.PARAMETER Identity
The container identity to remove.
.EXAMPLE
Remove-Designer -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    $container = Get-DesignerContainerBase -Identity $Identity
    if ($null -eq $container) {
        throw "Designer container '$Identity' was not found."
    }

    if ($PSCmdlet.ShouldProcess($Identity, 'Remove Designer container')) {
        Remove-SPOContainer -Identity $Identity
    }
}
