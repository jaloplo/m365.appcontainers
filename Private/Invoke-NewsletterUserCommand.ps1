function Invoke-NewsletterUserCommand {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Owner','Reader','Writer','Manager')]
        [string]$Role,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Add','Set','Remove')]
        [string]$Action,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Identity,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$User
    )

    $container = Get-NewsletterContainerBase -Identity $Identity
    if ($null -eq $container) {
        throw "Outlook Newsletters container '$Identity' was not found."
    }

    switch ($Action) {
        'Add' { return Add-SPOContainerUser -ContainerId $Identity -LoginName $User -Role $Role }
        'Set' { return Set-SPOContainerUser -ContainerId $Identity -LoginName $User -Role $Role }
        'Remove' { return Remove-SPOContainerUser -ContainerId $Identity -LoginName $User -Role $Role }
    }
}
