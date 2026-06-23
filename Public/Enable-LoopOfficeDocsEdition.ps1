function Enable-LoopOfficeDocsEdition {
<#!
.SYNOPSIS
Enables Office document editing for a Loop container.
.PARAMETER Identity
The container identity.
.EXAMPLE
Enable-LoopOfficeDocsEdition -Identity 'container-id'
#>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity
    )

    Invoke-LoopContainerUpdate -Identity $Identity -Settings @{ AllowEditing = $true } -ActionDescription 'Enable Loop Office document editing'
}
