Set-StrictMode -Version Latest

$privatePath = Join-Path -Path $PSScriptRoot -ChildPath 'Private'
if (Test-Path -Path $privatePath) {
    Get-ChildItem -Path $privatePath -Filter '*.ps1' -File | Sort-Object Name | ForEach-Object {
        . $_.FullName
    }
}

$publicPath = Join-Path -Path $PSScriptRoot -ChildPath 'Public'
$publicFunctions = @()
if (Test-Path -Path $publicPath) {
    Get-ChildItem -Path $publicPath -Filter '*.ps1' -File | Sort-Object Name | ForEach-Object {
        . $_.FullName
        $publicFunctions += [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
    }
}

if ($publicFunctions.Count -gt 0) {
    Export-ModuleMember -Function $publicFunctions
}
