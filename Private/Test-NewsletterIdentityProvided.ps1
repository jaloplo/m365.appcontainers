function Test-NewsletterIdentityProvided {
    [CmdletBinding()]
    param(
        [Parameter()]
        [AllowNull()]
        [AllowEmptyString()]
        [string]$Identity
    )

    $PSBoundParameters.ContainsKey('Identity') -and -not [string]::IsNullOrWhiteSpace($Identity)
}
