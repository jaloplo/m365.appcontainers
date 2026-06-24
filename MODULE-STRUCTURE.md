# Module Structure Reference

This repository is organized as a multi-workload PowerShell module for administering Microsoft 365 application containers. The current structure includes **Loop**, **Designer**, and **Newsletter** command folders, plus shared private helper functions loaded by the root module.

## Top-level files

- `M365.AppContainers.psm1`  
  Root module file. It enables strict mode, dot-sources internal helper functions from `Private/`, then loads public commands from `Public/Loop/`, `Public/Designer/`, and `Public/Newsletter/`, and exports all loaded public functions.

- `M365.AppContainers.psd1`  
  PowerShell module manifest containing module metadata such as version, minimum PowerShell version, and the explicit `FunctionsToExport` list.

- `README.md`  
  Main user-facing documentation for the module.

- `MODULE-STRUCTURE.md`  
  This repository structure reference.

## Folder layout

```text
.
├── M365.AppContainers.psd1
├── M365.AppContainers.psm1
├── MODULE-STRUCTURE.md
├── README.md
├── Private/
│   ├── Get-DesignerContainerBase.ps1
│   ├── Get-DesignerContainerSetting.ps1
│   ├── Get-DesignerRestrictedAccessControlGroups.ps1
│   ├── Get-LoopContainerBase.ps1
│   ├── Get-LoopContainerSetting.ps1
│   ├── Get-LoopRestrictedAccessControlGroups.ps1
│   ├── Get-NewsletterContainerBase.ps1
│   ├── Get-NewsletterContainerSetting.ps1
│   ├── Get-NewsletterRestrictedAccessControlGroups.ps1
│   ├── Invoke-DesignerContainerUpdate.ps1
│   ├── Invoke-DesignerUserCommand.ps1
│   ├── Invoke-LoopContainerUpdate.ps1
│   ├── Invoke-LoopUserCommand.ps1
│   ├── Invoke-NewsletterContainerUpdate.ps1
│   ├── Invoke-NewsletterUserCommand.ps1
│   ├── Test-DesignerContainer.ps1
│   ├── Test-DesignerIdentityProvided.ps1
│   ├── Test-LoopContainer.ps1
│   ├── Test-LoopIdentityProvided.ps1
│   ├── Test-NewsletterContainer.ps1
│   └── Test-NewsletterIdentityProvided.ps1
└── Public/
    ├── Designer/
    ├── Loop/
    └── Newsletter/
```

## Root module behavior

`M365.AppContainers.psm1` loads files in this order:

1. Every `*.ps1` file in `Private/`
2. Every `*.ps1` file in `Public/Loop/`
3. Every `*.ps1` file in `Public/Designer/`
4. Every `*.ps1` file in `Public/Newsletter/`
5. Exports all discovered public functions with `Export-ModuleMember`

This design means:

- Shared implementation details live in `Private/` and are available to all workloads.
- Public commands are grouped by workload instead of being stored in one flat folder.
- Adding a new command usually involves placing a new `.ps1` file in the appropriate workload folder and keeping `FunctionsToExport` in `M365.AppContainers.psd1` aligned with the intended public surface area.
- The root module can load commands that exist on disk even if the manifest has not yet been updated to export them explicitly when imported via the manifest.

## Private helper functions

The `Private/` folder contains internal helpers used by the public command implementations.

### Shared patterns by workload

Each workload currently has a parallel helper set:

- `Get-<Workload>ContainerBase.ps1`  
  Retrieves base container data and applies common filtering or validation logic.

- `Get-<Workload>ContainerSetting.ps1`  
  Returns a normalized view of a specific container setting.

- `Get-<Workload>RestrictedAccessControlGroups.ps1`  
  Extracts restricted access control group information from a container object.

- `Invoke-<Workload>ContainerUpdate.ps1`  
  Centralizes configuration update operations for a workload.

- `Invoke-<Workload>UserCommand.ps1`  
  Implements shared user-role operations such as add, set, and remove.

- `Test-<Workload>Container.ps1`  
  Confirms that the target container belongs to the expected workload.

- `Test-<Workload>IdentityProvided.ps1`  
  Validates that a usable `Identity` value was supplied.

### Private helper inventory

#### Designer helpers

- `Private/Get-DesignerContainerBase.ps1`
- `Private/Get-DesignerContainerSetting.ps1`
- `Private/Get-DesignerRestrictedAccessControlGroups.ps1`
- `Private/Invoke-DesignerContainerUpdate.ps1`
- `Private/Invoke-DesignerUserCommand.ps1`
- `Private/Test-DesignerContainer.ps1`
- `Private/Test-DesignerIdentityProvided.ps1`

#### Loop helpers

- `Private/Get-LoopContainerBase.ps1`
- `Private/Get-LoopContainerSetting.ps1`
- `Private/Get-LoopRestrictedAccessControlGroups.ps1`
- `Private/Invoke-LoopContainerUpdate.ps1`
- `Private/Invoke-LoopUserCommand.ps1`
- `Private/Test-LoopContainer.ps1`
- `Private/Test-LoopIdentityProvided.ps1`

#### Newsletter helpers

- `Private/Get-NewsletterContainerBase.ps1`
- `Private/Get-NewsletterContainerSetting.ps1`
- `Private/Get-NewsletterRestrictedAccessControlGroups.ps1`
- `Private/Invoke-NewsletterContainerUpdate.ps1`
- `Private/Invoke-NewsletterUserCommand.ps1`
- `Private/Test-NewsletterContainer.ps1`
- `Private/Test-NewsletterIdentityProvided.ps1`

## Public command folders

The `Public/` folder is divided by workload.

### `Public/Loop/`

This folder contains Loop container administration commands.

#### Lifecycle and discovery

- `Get-Loop.ps1`
- `Get-DeletedLoop.ps1`
- `Get-LoopArchived.ps1`
- `Get-LoopRecentlyArchived.ps1`
- `Get-LoopFullyArchived.ps1`
- `Get-LoopReactivating.ps1`
- `Get-LoopNotArchived.ps1`
- `Remove-Loop.ps1`

#### User role management

- `Add-LoopOwner.ps1`
- `Add-LoopReader.ps1`
- `Add-LoopWriter.ps1`
- `Add-LoopManager.ps1`
- `Set-LoopOwner.ps1`
- `Set-LoopReader.ps1`
- `Set-LoopWriter.ps1`
- `Set-LoopManager.ps1`
- `Remove-LoopOwner.ps1`
- `Remove-LoopReader.ps1`
- `Remove-LoopWriter.ps1`
- `Remove-LoopManager.ps1`

#### Access control and download restrictions

- `Enable-LoopAccessControl.ps1`
- `Disable-LoopAccessControl.ps1`
- `Add-LoopAccessControlGroup.ps1`
- `Remove-LoopAccessControlGroup.ps1`
- `Clear-LoopAccessControlGroups.ps1`
- `Block-LoopDownload.ps1`
- `Block-LoopDownloadExceptOwners.ps1`
- `Unblock-LoopDownload.ps1`

#### Search, labels, and sharing settings

- `Get-LoopPrincipalOwner.ps1`
- `Enable-LoopTenantSearch.ps1`
- `Disable-LoopTenantSearch.ps1`
- `Get-LoopTenantSearch.ps1`
- `Set-LoopSensitivityLabel.ps1`
- `Get-LoopSensitivityLabel.ps1`
- `Remove-LoopSensitivityLabel.ps1`
- `Allow-LoopSharingDomains.ps1`
- `Block-LoopSharingDomains.ps1`
- `Get-LoopSharingDomains.ps1`
- `Disable-LoopSharingDomains.ps1`

### `Public/Designer/`

This folder contains Designer container administration commands.

#### Lifecycle and discovery

- `Get-Designer.ps1`
- `Get-DeletedDesigner.ps1`
- `Get-DesignerArchived.ps1`
- `Get-DesignerRecentlyArchived.ps1`
- `Get-DesignerFullyArchived.ps1`
- `Get-DesignerReactivating.ps1`
- `Get-DesignerNotArchived.ps1`
- `Remove-Designer.ps1`

#### User role management

- `Add-DesignerOwner.ps1`
- `Add-DesignerReader.ps1`
- `Add-DesignerWriter.ps1`
- `Add-DesignerManager.ps1`
- `Set-DesignerOwner.ps1`
- `Set-DesignerReader.ps1`
- `Set-DesignerWriter.ps1`
- `Set-DesignerManager.ps1`
- `Remove-DesignerOwner.ps1`
- `Remove-DesignerReader.ps1`
- `Remove-DesignerWriter.ps1`
- `Remove-DesignerManager.ps1`

#### Access control and download restrictions

- `Enable-DesignerAccessControl.ps1`
- `Disable-DesignerAccessControl.ps1`
- `Add-DesignerAccessControlGroup.ps1`
- `Remove-DesignerAccessControlGroup.ps1`
- `Clear-DesignerAccessControlGroups.ps1`
- `Block-DesignerDownload.ps1`
- `Block-DesignerDownloadExceptOwners.ps1`
- `Unblock-DesignerDownload.ps1`

#### Search, labels, and sharing settings

- `Get-DesignerPrincipalOwner.ps1`
- `Enable-DesignerTenantSearch.ps1`
- `Disable-DesignerTenantSearch.ps1`
- `Get-DesignerTenantSearch.ps1`
- `Set-DesignerSensitivityLabel.ps1`
- `Get-DesignerSensitivityLabel.ps1`
- `Remove-DesignerSensitivityLabel.ps1`
- `Allow-DesignerSharingDomains.ps1`
- `Block-DesignerSharingDomains.ps1`
- `Get-DesignerSharingDomains.ps1`
- `Disable-DesignerSharingDomains.ps1`

### `Public/Newsletter/`

This folder contains Newsletter container administration commands.

#### Lifecycle and discovery

- `Get-Newsletter.ps1`
- `Get-DeletedNewsletter.ps1`
- `Get-NewsletterArchived.ps1`
- `Get-NewsletterRecentlyArchived.ps1`
- `Get-NewsletterFullyArchived.ps1`
- `Get-NewsletterReactivating.ps1`
- `Get-NewsletterNotArchived.ps1`
- `Remove-Newsletter.ps1`

#### User role management

- `Add-NewsletterOwner.ps1`
- `Add-NewsletterReader.ps1`
- `Add-NewsletterWriter.ps1`
- `Add-NewsletterManager.ps1`
- `Set-NewsletterOwner.ps1`
- `Set-NewsletterReader.ps1`
- `Set-NewsletterWriter.ps1`
- `Set-NewsletterManager.ps1`
- `Remove-NewsletterOwner.ps1`
- `Remove-NewsletterReader.ps1`
- `Remove-NewsletterWriter.ps1`
- `Remove-NewsletterManager.ps1`

#### Access control and download restrictions

- `Enable-NewsletterAccessControl.ps1`
- `Disable-NewsletterAccessControl.ps1`
- `Add-NewsletterAccessControlGroup.ps1`
- `Remove-NewsletterAccessControlGroup.ps1`
- `Clear-NewsletterAccessControlGroups.ps1`
- `Block-NewsletterDownload.ps1`
- `Block-NewsletterDownloadExceptOwners.ps1`
- `Unblock-NewsletterDownload.ps1`

#### Search, labels, and sharing settings

- `Get-NewsletterPrincipalOwner.ps1`
- `Enable-NewsletterTenantSearch.ps1`
- `Disable-NewsletterTenantSearch.ps1`
- `Get-NewsletterTenantSearch.ps1`
- `Set-NewsletterSensitivityLabel.ps1`
- `Get-NewsletterSensitivityLabel.ps1`
- `Remove-NewsletterSensitivityLabel.ps1`
- `Allow-NewsletterSharingDomains.ps1`
- `Block-NewsletterSharingDomains.ps1`
- `Get-NewsletterSharingDomains.ps1`
- `Disable-NewsletterSharingDomains.ps1`

## Manifest and export alignment

The current manifest exports **Loop** and **Designer** functions explicitly in `FunctionsToExport`, but it does **not** currently include the `Newsletter` functions even though the root module loads `Public/Newsletter/`.

That means the repository structure and module loader already support Newsletter commands, but the manifest should be reviewed if Newsletter functions are intended to be part of the public module surface when importing through the manifest.

## Notes about the current structure

- The module uses workload-specific public folders instead of a flat command layout.
- The private helper structure follows a consistent naming convention across workloads.
- `Newsletter` is present in both `Private/` and `Public/`, so the repository has progressed beyond the older two-workload structure.
- `M365.AppContainers.psm1` is the source of truth for load order.
- `M365.AppContainers.psd1` is the source of truth for explicit exported functions when using the manifest.

## Recommended maintenance practices

- Keep `FunctionsToExport` synchronized with the command files under `Public/`.
- When adding a new workload, mirror the existing pattern:
  - Add workload-specific helper functions under `Private/`
  - Add public commands under `Public/<Workload>/`
  - Update `M365.AppContainers.psm1` to load the new folder
  - Update `M365.AppContainers.psd1` to export the intended public functions
- Update `README.md` and command documentation whenever the folder structure or public surface changes.
