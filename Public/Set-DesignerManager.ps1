function Set-DesignerManager {
<#
.SYNOPSIS
Sets a user as manager in a Designer container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Set-DesignerManager -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-DesignerUserCommand -Action Set -Role Manager -Identity $Identity -User $User
}
