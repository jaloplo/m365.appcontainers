function Remove-DesignerManager {
<#
.SYNOPSIS
Removes a manager from a Designer container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Remove-DesignerManager -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-DesignerUserCommand -Action Remove -Role Manager -Identity $Identity -User $User
}
