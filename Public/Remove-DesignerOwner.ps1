function Remove-DesignerOwner {
<#
.SYNOPSIS
Removes an owner from a Designer container.
.PARAMETER Identity
The container identity.
.PARAMETER User
The user email address.
.EXAMPLE
Remove-DesignerOwner -Identity 'container-id' -User 'user@contoso.com'
#>
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$Identity,[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$User)
    Invoke-DesignerUserCommand -Action Remove -Role Owner -Identity $Identity -User $User
}
