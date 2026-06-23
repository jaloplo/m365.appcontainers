function Disable-LoopOfficeDocsEdition {
<#!
.SYNOPSIS
Disables Office document editing for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Disable-LoopOfficeDocsEdition -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ AllowEditing = $false } -ActionDescription 'Disable Loop Office document editing'
}
