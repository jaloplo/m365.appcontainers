# Module Structure Reference

This repository is organized as a PowerShell module that loads private helpers and exports public commands from product-specific folders. The current layout supports both **Loop** and **Designer** container administration.

## Top-level files

- `M365.AppContainers.psm1`  
  Root module file. It dot-sources every helper in `Private/`, then loads public commands from `Public/Loop/` and `Public/Designer/`, and finally exports those functions.

- `M365.AppContainers.psd1`  
  PowerShell module manifest that defines module metadata and the published function export list.

- `README.md`  
  Main user-facing documentation. It currently focuses on Loop commands and examples.

- `MODULE-STRUCTURE.md`  
  This reference document describing the repository layout and the purpose of each module component.

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
│   ├── Invoke-DesignerContainerUpdate.ps1
│   ├── Invoke-DesignerUserCommand.ps1
│   ├── Invoke-LoopContainerUpdate.ps1
│   ├── Invoke-LoopUserCommand.ps1
│   ├── Test-DesignerContainer.ps1
│   ├── Test-DesignerIdentityProvided.ps1
│   ├── Test-LoopContainer.ps1
│   └── Test-LoopIdentityProvided.ps1
└── Public/
    ├── Designer/
    └── Loop/
```

## Root module behavior

`M365.AppContainers.psm1` loads files in this order:

1. Every `*.ps1` file in `Private/`
2. Every `*.ps1` file in `Public/Loop/`
3. Every `*.ps1` file in `Public/Designer/`
4. Exports all loaded public functions

This means:

- Private helpers are available to both product areas.
- Public commands are grouped by workload instead of being placed in a single shared folder.
- Adding a new command usually means dropping a new `.ps1` file into the correct public folder and, if needed, updating `FunctionsToExport` in `M365.AppContainers.psd1`.

## Private helpers

The `Private/` folder contains reusable internal functions shared by public commands.

### Designer helpers

- `Private/Get-DesignerContainerBase.ps1`  
  Retrieves Designer containers and applies common filtering behavior.

- `Private/Get-DesignerContainerSetting.ps1`  
  Returns selected Designer container settings in a normalized output shape.

- `Private/Get-DesignerRestrictedAccessControlGroups.ps1`  
  Extracts restricted access control groups from a Designer container object.

- `Private/Invoke-DesignerContainerUpdate.ps1`  
  Reusable helper for Designer container configuration updates with `ShouldProcess` support.

- `Private/Invoke-DesignerUserCommand.ps1`  
  Shared implementation for add, set, and remove user-role operations on Designer containers.

- `Private/Test-DesignerContainer.ps1`  
  Validates that a returned SharePoint container belongs to the Designer workload.

- `Private/Test-DesignerIdentityProvided.ps1`  
  Checks whether a non-empty `Identity` parameter was supplied for Designer-oriented commands.

### Loop helpers

- `Private/Get-LoopContainerBase.ps1`  
  Retrieves Loop containers and applies common filtering behavior, including archive-state handling.

- `Private/Get-LoopContainerSetting.ps1`  
  Returns selected Loop container settings in a normalized output shape.

- `Private/Get-LoopRestrictedAccessControlGroups.ps1`  
  Extracts restricted access control groups from a Loop container object.

- `Private/Invoke-LoopContainerUpdate.ps1`  
  Reusable helper for Loop container configuration updates with `ShouldProcess` support.

- `Private/Invoke-LoopUserCommand.ps1`  
  Shared implementation for add, set, and remove user-role operations on Loop containers.

- `Private/Test-LoopContainer.ps1`  
  Validates that a returned SharePoint container belongs to the Loop workload.

- `Private/Test-LoopIdentityProvided.ps1`  
  Checks whether a non-empty `Identity` parameter was supplied for Loop-oriented commands.

## Public commands

The `Public/` folder is separated by workload.

### `Public/Designer/`

This folder exists in the current structure and is loaded by the module root. Its commands are exported when present in the manifest.

### `Public/Loop/`

This folder contains the current Loop administration commands.

#### Discovery and lifecycle

- `Public/Loop/Get-Loop.ps1` — Retrieves Loop containers, optionally by identity.
- `Public/Loop/Get-DeletedLoop.ps1` — Retrieves deleted Loop containers, optionally by identity.
- `Public/Loop/Get-LoopArchived.ps1` — Retrieves Loop containers in the Archived state.
- `Public/Loop/Get-LoopRecentlyArchived.ps1` — Retrieves Loop containers in the RecentlyArchived state.
- `Public/Loop/Get-LoopFullyArchived.ps1` — Retrieves Loop containers in the FullyArchived state.
- `Public/Loop/Get-LoopReactivating.ps1` — Retrieves Loop containers in the Reactivating state.
- `Public/Loop/Get-LoopNotArchived.ps1` — Retrieves Loop containers outside archived-related states.
- `Public/Loop/Remove-Loop.ps1` — Removes an existing Loop container.

#### User role management

- `Public/Loop/Add-LoopOwner.ps1` — Adds an owner to a Loop container.
- `Public/Loop/Add-LoopReader.ps1` — Adds a reader to a Loop container.
- `Public/Loop/Add-LoopWriter.ps1` — Adds a writer to a Loop container.
- `Public/Loop/Add-LoopManager.ps1` — Adds a manager to a Loop container.
- `Public/Loop/Set-LoopOwner.ps1` — Sets a user's role to owner for a Loop container.
- `Public/Loop/Set-LoopReader.ps1` — Sets a user's role to reader for a Loop container.
- `Public/Loop/Set-LoopWriter.ps1` — Sets a user's role to writer for a Loop container.
- `Public/Loop/Set-LoopManager.ps1` — Sets a user's role to manager for a Loop container.
- `Public/Loop/Remove-LoopOwner.ps1` — Removes an owner from a Loop container.
- `Public/Loop/Remove-LoopReader.ps1` — Removes a reader from a Loop container.
- `Public/Loop/Remove-LoopWriter.ps1` — Removes a writer from a Loop container.
- `Public/Loop/Remove-LoopManager.ps1` — Removes a manager from a Loop container.

#### Download controls

- `Public/Loop/Block-LoopDownload.ps1` — Blocks downloads for a Loop container.
- `Public/Loop/Block-LoopDownloadExceptOwners.ps1` — Blocks downloads while still allowing owners to download.
- `Public/Loop/Unblock-LoopDownload.ps1` — Removes Loop download restrictions.

#### Restricted access control

- `Public/Loop/Enable-LoopAccessControl.ps1` — Enables restricted access control on a Loop container.
- `Public/Loop/Disable-LoopAccessControl.ps1` — Disables restricted access control on a Loop container.
- `Public/Loop/Add-LoopAccessControlGroup.ps1` — Adds a group to the restricted access control configuration.
- `Public/Loop/Remove-LoopAccessControlGroup.ps1` — Removes a group from the restricted access control configuration.
- `Public/Loop/Clear-LoopAccessControlGroups.ps1` — Clears all restricted access control groups.

#### Ownership, search, and labeling

- `Public/Loop/Get-LoopPrincipalOwner.ps1` — Retrieves principal owner metadata from a Loop container.
- `Public/Loop/Disable-LoopTenantSearch.ps1` — Disables tenant-wide search visibility for a Loop container.
- `Public/Loop/Enable-LoopTenantSearch.ps1` — Enables tenant-wide search visibility for a Loop container.
- `Public/Loop/Get-LoopTenantSearch.ps1` — Retrieves the tenant search setting for a Loop container.
- `Public/Loop/Set-LoopSensitivityLabel.ps1` — Applies a sensitivity label to a Loop container.
- `Public/Loop/Get-LoopSensitivityLabel.ps1` — Retrieves sensitivity label configuration from a Loop container.
- `Public/Loop/Remove-LoopSensitivityLabel.ps1` — Removes the sensitivity label from a Loop container.

#### Sharing domain restrictions

- `Public/Loop/Allow-LoopSharingDomains.ps1` — Configures an allow list of sharing domains for a Loop container.
- `Public/Loop/Block-LoopSharingDomains.ps1` — Configures a block list of sharing domains for a Loop container.
- `Public/Loop/Get-LoopSharingDomains.ps1` — Retrieves sharing domain restriction settings for a Loop container.
- `Public/Loop/Disable-LoopSharingDomains.ps1` — Removes sharing domain restrictions.

## Notes about the current structure

- The current implementation no longer uses a flat `Public/` folder for Loop commands; they are stored under `Public/Loop/`.
- The module root is already prepared to support multiple workloads through separate public folders.
- The manifest export list should stay aligned with the command files that are intended to be public.
- `README.md` currently documents Loop commands at a high level, while this file documents the repository structure itself.

## Documentation improvement opportunities

If you want the command documentation to match the current repository structure more closely, consider organizing user-facing docs by workload and capability, for example:

- Loop discovery and lifecycle
- Loop user-role management
- Loop access and security settings
- Designer commands in a dedicated section once documented
