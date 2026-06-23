function Remove-Loop {
<#
.SYNOPSIS
Removes a Loop container.
.DESCRIPTION
Removes the specified Loop container by wrapping Remove-SPOContainer.
.PARAMETER Identity
The container identity to remove.
.EXAMPLE
Remove-Loop -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    $container = Get-LoopContainerBase -Identity $Identity
    if ($null -eq $container) {
        throw "Loop container '$Identity' was not found."
    }

    if ($PSCmdlet.ShouldProcess($Identity, 'Remove Loop container')) {
        Remove-SPOContainer -Identity $Identity
    }
}
