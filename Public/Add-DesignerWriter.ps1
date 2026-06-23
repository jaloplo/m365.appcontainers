function Add-DesignerWriter {
<#
.SYNOPSIS
Adds a writer to a Designer container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Add-DesignerWriter -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-DesignerUserCommand -Action Add -Role Writer -Identity $Identity -User $User
}
