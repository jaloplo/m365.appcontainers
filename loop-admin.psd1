@{
    RootModule = 'loop-admin.psm1'
    ModuleVersion = '1.0.0'
    GUID = '9b0ae6d3-5a78-4c2f-9b43-2c5e4f08a71d'
    Author = 'OpenAI'
    CompanyName = 'OpenAI'
    Copyright = '(c) OpenAI. All rights reserved.'
    Description = 'SharePoint Online Loop container administration module.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @(
        'Add-LoopAccessControlGroup',
        'Add-LoopManager',
        'Add-LoopOwner',
        'Add-LoopReader',
        'Add-LoopWriter',
        'Allow-LoopSharingDomains',
        'Block-LoopDownload',
        'Block-LoopDownloadExceptOwners',
        'Block-LoopSharingDomains',
        'Clear-LoopAccessControlGroups',
        'Disable-LoopAccessControl',
        'Disable-LoopOfficeDocsEdition',
        'Disable-LoopSharingDomains',
        'Disable-LoopTenantSearch',
        'Enable-LoopAccessControl',
        'Enable-LoopOfficeDocsEdition',
        'Enable-LoopTenantSearch',
        'Get-DeletedLoop',
        'Get-Loop',
        'Get-LoopArchived',
        'Get-LoopFullyArchived',
        'Get-LoopNotArchived',
        'Get-LoopPrincipalOwner',
        'Get-LoopReactivating',
        'Get-LoopRecentlyArchived',
        'Get-LoopSensitivityLabel',
        'Get-LoopSharingDomains',
        'Get-LoopTenantSearch',
        'Remove-Loop',
        'Remove-LoopAccessControlGroup',
        'Remove-LoopManager',
        'Remove-LoopOwner',
        'Remove-LoopReader',
        'Remove-LoopSensitivityLabel',
        'Remove-LoopWriter',
        'Set-LoopManager',
        'Set-LoopOwner',
        'Set-LoopReader',
        'Set-LoopSensitivityLabel',
        'Set-LoopWriter',
        'Unblock-LoopDownload'
    )
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('PowerShell', 'SharePoint', 'Loop', 'SPO')
            ProjectUri = ''
            LicenseUri = ''
            ReleaseNotes = 'Initial manifest for the split loop-admin module structure.'
        }
    }
}
