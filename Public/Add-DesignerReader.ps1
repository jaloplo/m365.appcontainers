function Add-DesignerReader {
<#
.SYNOPSIS
Adds a reader to a Designer container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Add-DesignerReader -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-DesignerUserCommand -Action Add -Role Reader -Identity $Identity -User $User
}
