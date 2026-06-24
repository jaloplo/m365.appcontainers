@{
    RootModule = 'M365.AppContainers.psm1'
    ModuleVersion = '1.0.0'
    GUID = '9b0ae6d3-5a78-4c2f-9b43-2c5e4f08a71d'
    Author = 'Jaime López Lóez'
    CompanyName = ''
    Copyright = ''
    Description = 'SharePoint Online Loop and Designer administration module.'
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
        'Disable-LoopSharingDomains',
        'Disable-LoopTenantSearch',
        'Enable-LoopAccessControl',
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
        'Unblock-LoopDownload',
        'Add-DesignerAccessControlGroup',
        'Add-DesignerManager',
        'Add-DesignerOwner',
        'Add-DesignerReader',
        'Add-DesignerWriter',
        'Allow-DesignerSharingDomains',
        'Block-DesignerDownload',
        'Block-DesignerDownloadExceptOwners',
        'Block-DesignerSharingDomains',
        'Clear-DesignerAccessControlGroups',
        'Disable-DesignerAccessControl',
        'Disable-DesignerSharingDomains',
        'Disable-DesignerTenantSearch',
        'Enable-DesignerAccessControl',
        'Enable-DesignerTenantSearch',
        'Get-DeletedDesigner',
        'Get-Designer',
        'Get-DesignerArchived',
        'Get-DesignerFullyArchived',
        'Get-DesignerNotArchived',
        'Get-DesignerPrincipalOwner',
        'Get-DesignerReactivating',
        'Get-DesignerRecentlyArchived',
        'Get-DesignerSensitivityLabel',
        'Get-DesignerSharingDomains',
        'Get-DesignerTenantSearch',
        'Remove-Designer',
        'Remove-DesignerAccessControlGroup',
        'Remove-DesignerManager',
        'Remove-DesignerOwner',
        'Remove-DesignerReader',
        'Remove-DesignerSensitivityLabel',
        'Remove-DesignerWriter',
        'Set-DesignerManager',
        'Set-DesignerOwner',
        'Set-DesignerReader',
        'Set-DesignerSensitivityLabel',
        'Set-DesignerWriter',
        'Unblock-DesignerDownload'
    )
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('PowerShell', 'SharePoint', 'Loop', 'Designer', 'SPO')
            ProjectUri = ''
            LicenseUri = ''
            ReleaseNotes = 'Updated manifest to match current module structure and exported Loop and Designer functions.'
        }
    }
}
