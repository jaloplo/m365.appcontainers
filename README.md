# M365.AppContainers

## Synopsis
`M365.AppContainers` is a PowerShell module for administering **Microsoft 365 SharePoint Online app containers** used by **Loop**, **Designer**, and **Outlook Newsletters**. It provides task-focused commands for discovering containers, managing membership roles, applying security controls, configuring sharing restrictions, and handling lifecycle operations.

This module is written for both:
- **Business stakeholders** who want to understand what the module enables operationally
- **Technicians and administrators** who need install, usage, and command guidance

---

## Business Overview

### What this module helps you do
This module standardizes administration of Loop, Designer, and Outlook Newsletter containers in SharePoint Online so teams can:
- apply security settings consistently
- reduce manual configuration work
- delegate and manage container access
- control search, download, sharing, and labeling behaviors
- support repeatable operational processes for Microsoft 365 governance

### Business value
- **Operational consistency:** Administrators use repeatable commands instead of ad hoc manual changes.
- **Security and compliance:** Teams can enforce access control, sensitivity labels, download restrictions, and domain sharing policies.
- **Efficiency:** Common administrative actions are wrapped in simple PowerShell functions.
- **Governance at scale:** The module groups related capabilities for Loop, Designer, and Outlook Newsletters into predictable command sets.

### Typical scenarios
- Find Loop, Designer, or Outlook Newsletter containers by identity or state
- Assign owners, readers, writers, or managers
- Remove containers that are no longer needed
- Restrict downloads or allow downloads only for owners
- Enable or disable restricted access control
- Configure allowed or blocked sharing domains
- Review tenant search and sensitivity label settings

---

## Prerequisites and Installation

### Requirements
- **Windows PowerShell 5.1** or later
- Access to the **SharePoint Online Management Shell** cmdlets used by the module
- Permissions to view and modify SharePoint Online app containers in your tenant

### PowerShell version
The module manifest declares a minimum PowerShell version of:

```powershell
5.1
```

### External dependency
The module calls SharePoint Online container cmdlets such as:
- `Get-SPOContainer`
- `Set-SPOContainer`
- `Remove-SPOContainer`
- `Get-SPODeletedContainer`
- `Add-SPOContainerUser`
- `Set-SPOContainerUser`
- `Remove-SPOContainerUser`

Make sure the required SharePoint Online administration tooling is installed and connected before using this module.

### Import the module
If loading from the current folder:

```powershell
Import-Module .\M365.AppContainers.psd1
```

If installed in a standard module path:

```powershell
Import-Module M365.AppContainers
```

### Verify import
```powershell
Get-Module M365.AppContainers
Get-Command -Module M365.AppContainers
```

---

## Exported Cmdlets

### Loop cmdlets

| Cmdlet | Description |
|---|---|
| `Add-LoopAccessControlGroup` | Adds a restricted access control group to a Loop container. |
| `Add-LoopManager` | Adds a manager to a Loop container. |
| `Add-LoopOwner` | Adds an owner to a Loop container. |
| `Add-LoopReader` | Adds a reader to a Loop container. |
| `Add-LoopWriter` | Adds a writer to a Loop container. |
| `Allow-LoopSharingDomains` | Configures an allowed domain list for Loop sharing. |
| `Block-LoopDownload` | Blocks downloads for a Loop container. |
| `Block-LoopDownloadExceptOwners` | Blocks downloads except for owners of the Loop container. |
| `Block-LoopSharingDomains` | Configures a blocked domain list for Loop sharing. |
| `Clear-LoopAccessControlGroups` | Removes all restricted access control groups from a Loop container. |
| `Disable-LoopAccessControl` | Disables restricted access control on a Loop container. |
| `Disable-LoopSharingDomains` | Removes sharing domain restrictions from a Loop container. |
| `Disable-LoopTenantSearch` | Disables tenant-wide search visibility for a Loop container. |
| `Enable-LoopAccessControl` | Enables restricted access control on a Loop container. |
| `Enable-LoopTenantSearch` | Enables tenant-wide search visibility for a Loop container. |
| `Get-DeletedLoop` | Gets deleted Loop containers. |
| `Get-Loop` | Gets Loop containers. |
| `Get-LoopArchived` | Gets Loop containers in the archived state. |
| `Get-LoopFullyArchived` | Gets fully archived Loop containers. |
| `Get-LoopNotArchived` | Gets Loop containers that are not in archived states. |
| `Get-LoopPrincipalOwner` | Gets the principal owner details for a Loop container. |
| `Get-LoopReactivating` | Gets Loop containers in the reactivating state. |
| `Get-LoopRecentlyArchived` | Gets recently archived Loop containers. |
| `Get-LoopSensitivityLabel` | Gets the configured sensitivity label for a Loop container. |
| `Get-LoopSharingDomains` | Gets the sharing domain configuration for a Loop container. |
| `Get-LoopTenantSearch` | Gets the tenant search configuration for a Loop container. |
| `Remove-Loop` | Removes a Loop container. |
| `Remove-LoopAccessControlGroup` | Removes a restricted access control group from a Loop container. |
| `Remove-LoopManager` | Removes a manager from a Loop container. |
| `Remove-LoopOwner` | Removes an owner from a Loop container. |
| `Remove-LoopReader` | Removes a reader from a Loop container. |
| `Remove-LoopSensitivityLabel` | Removes the sensitivity label from a Loop container. |
| `Remove-LoopWriter` | Removes a writer from a Loop container. |
| `Set-LoopManager` | Sets a user's role to manager on a Loop container. |
| `Set-LoopOwner` | Sets a user's role to owner on a Loop container. |
| `Set-LoopReader` | Sets a user's role to reader on a Loop container. |
| `Set-LoopSensitivityLabel` | Sets the sensitivity label for a Loop container. |
| `Set-LoopWriter` | Sets a user's role to writer on a Loop container. |
| `Unblock-LoopDownload` | Removes Loop download restrictions. |

### Designer cmdlets

| Cmdlet | Description |
|---|---|
| `Add-DesignerAccessControlGroup` | Adds a restricted access control group to a Designer container. |
| `Add-DesignerManager` | Adds a manager to a Designer container. |
| `Add-DesignerOwner` | Adds an owner to a Designer container. |
| `Add-DesignerReader` | Adds a reader to a Designer container. |
| `Add-DesignerWriter` | Adds a writer to a Designer container. |
| `Allow-DesignerSharingDomains` | Configures an allowed domain list for Designer sharing. |
| `Block-DesignerDownload` | Blocks downloads for a Designer container. |
| `Block-DesignerDownloadExceptOwners` | Blocks downloads except for owners of the Designer container. |
| `Block-DesignerSharingDomains` | Configures a blocked domain list for Designer sharing. |
| `Clear-DesignerAccessControlGroups` | Removes all restricted access control groups from a Designer container. |
| `Disable-DesignerAccessControl` | Disables restricted access control on a Designer container. |
| `Disable-DesignerSharingDomains` | Removes sharing domain restrictions from a Designer container. |
| `Disable-DesignerTenantSearch` | Disables tenant-wide search visibility for a Designer container. |
| `Enable-DesignerAccessControl` | Enables restricted access control on a Designer container. |
| `Enable-DesignerTenantSearch` | Enables tenant-wide search visibility for a Designer container. |
| `Get-DeletedDesigner` | Gets deleted Designer containers. |
| `Get-Designer` | Gets Designer containers. |
| `Get-DesignerArchived` | Gets Designer containers in the archived state. |
| `Get-DesignerFullyArchived` | Gets fully archived Designer containers. |
| `Get-DesignerNotArchived` | Gets Designer containers that are not in archived states. |
| `Get-DesignerPrincipalOwner` | Gets the principal owner details for a Designer container. |
| `Get-DesignerReactivating` | Gets Designer containers in the reactivating state. |
| `Get-DesignerRecentlyArchived` | Gets recently archived Designer containers. |
| `Get-DesignerSensitivityLabel` | Gets the configured sensitivity label for a Designer container. |
| `Get-DesignerSharingDomains` | Gets the sharing domain configuration for a Designer container. |
| `Get-DesignerTenantSearch` | Gets the tenant search configuration for a Designer container. |
| `Remove-Designer` | Removes a Designer container. |
| `Remove-DesignerAccessControlGroup` | Removes a restricted access control group from a Designer container. |
| `Remove-DesignerManager` | Removes a manager from a Designer container. |
| `Remove-DesignerOwner` | Removes an owner from a Designer container. |
| `Remove-DesignerReader` | Removes a reader from a Designer container. |
| `Remove-DesignerSensitivityLabel` | Removes the sensitivity label from a Designer container. |
| `Remove-DesignerWriter` | Removes a writer from a Designer container. |
| `Set-DesignerManager` | Sets a user's role to manager on a Designer container. |
| `Set-DesignerOwner` | Sets a user's role to owner on a Designer container. |
| `Set-DesignerReader` | Sets a user's role to reader on a Designer container. |
| `Set-DesignerSensitivityLabel` | Sets the sensitivity label for a Designer container. |
| `Set-DesignerWriter` | Sets a user's role to writer on a Designer container. |
| `Unblock-DesignerDownload` | Removes Designer download restrictions. |

### Outlook Newsletter cmdlets

| Cmdlet | Description |
|---|---|
| `Add-NewsletterAccessControlGroup` | Adds a restricted access control group to an Outlook Newsletter container. |
| `Add-NewsletterManager` | Adds a manager to an Outlook Newsletter container. |
| `Add-NewsletterOwner` | Adds an owner to an Outlook Newsletter container. |
| `Add-NewsletterReader` | Adds a reader to an Outlook Newsletter container. |
| `Add-NewsletterWriter` | Adds a writer to an Outlook Newsletter container. |
| `Allow-NewsletterSharingDomains` | Configures an allowed domain list for Outlook Newsletter sharing. |
| `Block-NewsletterDownload` | Blocks downloads for an Outlook Newsletter container. |
| `Block-NewsletterDownloadExceptOwners` | Blocks downloads except for owners of the Outlook Newsletter container. |
| `Block-NewsletterSharingDomains` | Configures a blocked domain list for Outlook Newsletter sharing. |
| `Clear-NewsletterAccessControlGroups` | Removes all restricted access control groups from an Outlook Newsletter container. |
| `Disable-NewsletterAccessControl` | Disables restricted access control on an Outlook Newsletter container. |
| `Disable-NewsletterSharingDomains` | Removes sharing domain restrictions from an Outlook Newsletter container. |
| `Disable-NewsletterTenantSearch` | Disables tenant-wide search visibility for an Outlook Newsletter container. |
| `Enable-NewsletterAccessControl` | Enables restricted access control on an Outlook Newsletter container. |
| `Enable-NewsletterTenantSearch` | Enables tenant-wide search visibility for an Outlook Newsletter container. |
| `Get-DeletedNewsletter` | Gets deleted Outlook Newsletter containers. |
| `Get-Newsletter` | Gets Outlook Newsletter containers. |
| `Get-NewsletterArchived` | Gets Outlook Newsletter containers in the archived state. |
| `Get-NewsletterFullyArchived` | Gets fully archived Outlook Newsletter containers. |
| `Get-NewsletterNotArchived` | Gets Outlook Newsletter containers that are not in archived states. |
| `Get-NewsletterPrincipalOwner` | Gets the principal owner details for an Outlook Newsletter container. |
| `Get-NewsletterReactivating` | Gets Outlook Newsletter containers in the reactivating state. |
| `Get-NewsletterRecentlyArchived` | Gets recently archived Outlook Newsletter containers. |
| `Get-NewsletterSensitivityLabel` | Gets the configured sensitivity label for an Outlook Newsletter container. |
| `Get-NewsletterSharingDomains` | Gets the sharing domain configuration for an Outlook Newsletter container. |
| `Get-NewsletterTenantSearch` | Gets the tenant search configuration for an Outlook Newsletter container. |
| `Remove-Newsletter` | Removes an Outlook Newsletter container. |
| `Remove-NewsletterAccessControlGroup` | Removes a restricted access control group from an Outlook Newsletter container. |
| `Remove-NewsletterManager` | Removes a manager from an Outlook Newsletter container. |
| `Remove-NewsletterOwner` | Removes an owner from an Outlook Newsletter container. |
| `Remove-NewsletterReader` | Removes a reader from an Outlook Newsletter container. |
| `Remove-NewsletterSensitivityLabel` | Removes the sensitivity label from an Outlook Newsletter container. |
| `Remove-NewsletterWriter` | Removes a writer from an Outlook Newsletter container. |
| `Set-NewsletterManager` | Sets a user's role to manager on an Outlook Newsletter container. |
| `Set-NewsletterOwner` | Sets a user's role to owner on an Outlook Newsletter container. |
| `Set-NewsletterReader` | Sets a user's role to reader on an Outlook Newsletter container. |
| `Set-NewsletterSensitivityLabel` | Sets the sensitivity label for an Outlook Newsletter container. |
| `Set-NewsletterWriter` | Sets a user's role to writer on an Outlook Newsletter container. |
| `Unblock-NewsletterDownload` | Removes Outlook Newsletter download restrictions. |

---

## Workload Guide

## Loop administration

### Discovery and lifecycle
Use these commands to find and manage Loop containers:
- `Get-Loop`
- `Get-DeletedLoop`
- `Get-LoopArchived`
- `Get-LoopRecentlyArchived`
- `Get-LoopFullyArchived`
- `Get-LoopReactivating`
- `Get-LoopNotArchived`
- `Remove-Loop`

#### Examples
```powershell
Get-Loop

Get-Loop -Identity 'container-id'

Get-LoopArchived

Remove-Loop -Identity 'container-id' -WhatIf
```

### Membership and role management
Use these commands to manage container users and roles:
- `Add-LoopOwner`, `Set-LoopOwner`, `Remove-LoopOwner`
- `Add-LoopReader`, `Set-LoopReader`, `Remove-LoopReader`
- `Add-LoopWriter`, `Set-LoopWriter`, `Remove-LoopWriter`
- `Add-LoopManager`, `Set-LoopManager`, `Remove-LoopManager`

#### Examples
```powershell
Add-LoopOwner -Identity 'container-id' -User 'owner@contoso.com'

Set-LoopWriter -Identity 'container-id' -User 'author@contoso.com'

Remove-LoopReader -Identity 'container-id' -User 'reader@contoso.com'
```

### Security and governance
Use these commands to manage access and policy settings:
- Restricted access control: `Enable-LoopAccessControl`, `Disable-LoopAccessControl`, `Add-LoopAccessControlGroup`, `Remove-LoopAccessControlGroup`, `Clear-LoopAccessControlGroups`
- Download restrictions: `Block-LoopDownload`, `Block-LoopDownloadExceptOwners`, `Unblock-LoopDownload`
- Tenant search: `Enable-LoopTenantSearch`, `Disable-LoopTenantSearch`, `Get-LoopTenantSearch`
- Sensitivity labels: `Set-LoopSensitivityLabel`, `Get-LoopSensitivityLabel`, `Remove-LoopSensitivityLabel`
- Sharing domains: `Allow-LoopSharingDomains`, `Block-LoopSharingDomains`, `Get-LoopSharingDomains`, `Disable-LoopSharingDomains`

#### Examples
```powershell
Enable-LoopAccessControl -Identity 'container-id'

Get-LoopTenantSearch -Identity 'container-id'

Get-LoopSensitivityLabel -Identity 'container-id'

Get-LoopSharingDomains -Identity 'container-id'
```

---

## Designer administration

### Discovery and lifecycle
Use these commands to find and manage Designer containers:
- `Get-Designer`
- `Get-DeletedDesigner`
- `Get-DesignerArchived`
- `Get-DesignerRecentlyArchived`
- `Get-DesignerFullyArchived`
- `Get-DesignerReactivating`
- `Get-DesignerNotArchived`
- `Remove-Designer`

#### Examples
```powershell
Get-Designer

Get-Designer -Identity 'container-id'

Get-DeletedDesigner
```

### Membership and role management
Use these commands to manage container users and roles:
- `Add-DesignerOwner`, `Set-DesignerOwner`, `Remove-DesignerOwner`
- `Add-DesignerReader`, `Set-DesignerReader`, `Remove-DesignerReader`
- `Add-DesignerWriter`, `Set-DesignerWriter`, `Remove-DesignerWriter`
- `Add-DesignerManager`, `Set-DesignerManager`, `Remove-DesignerManager`

#### Examples
```powershell
Add-DesignerOwner -Identity 'container-id' -User 'owner@contoso.com'

Set-DesignerManager -Identity 'container-id' -User 'manager@contoso.com'

Remove-DesignerWriter -Identity 'container-id' -User 'writer@contoso.com'
```

### Security and governance
Use these commands to manage access and policy settings:
- Restricted access control: `Enable-DesignerAccessControl`, `Disable-DesignerAccessControl`, `Add-DesignerAccessControlGroup`, `Remove-DesignerAccessControlGroup`, `Clear-DesignerAccessControlGroups`
- Download restrictions: `Block-DesignerDownload`, `Block-DesignerDownloadExceptOwners`, `Unblock-DesignerDownload`
- Tenant search: `Enable-DesignerTenantSearch`, `Disable-DesignerTenantSearch`, `Get-DesignerTenantSearch`
- Sensitivity labels: `Set-DesignerSensitivityLabel`, `Get-DesignerSensitivityLabel`, `Remove-DesignerSensitivityLabel`
- Sharing domains: `Allow-DesignerSharingDomains`, `Block-DesignerSharingDomains`, `Get-DesignerSharingDomains`, `Disable-DesignerSharingDomains`

#### Examples
```powershell
Enable-DesignerAccessControl -Identity 'container-id'

Get-DesignerTenantSearch -Identity 'container-id'

Get-DesignerSensitivityLabel -Identity 'container-id'

Get-DesignerSharingDomains -Identity 'container-id'
```

---

## Outlook Newsletter administration

### Discovery and lifecycle
Use these commands to find and manage Outlook Newsletter containers:
- `Get-Newsletter`
- `Get-DeletedNewsletter`
- `Get-NewsletterArchived`
- `Get-NewsletterRecentlyArchived`
- `Get-NewsletterFullyArchived`
- `Get-NewsletterReactivating`
- `Get-NewsletterNotArchived`
- `Remove-Newsletter`

#### Examples
```powershell
Get-Newsletter

Get-Newsletter -Identity 'container-id'

Get-DeletedNewsletter

Remove-Newsletter -Identity 'container-id' -WhatIf
```

### Membership and role management
Use these commands to manage container users and roles:
- `Add-NewsletterOwner`, `Set-NewsletterOwner`, `Remove-NewsletterOwner`
- `Add-NewsletterReader`, `Set-NewsletterReader`, `Remove-NewsletterReader`
- `Add-NewsletterWriter`, `Set-NewsletterWriter`, `Remove-NewsletterWriter`
- `Add-NewsletterManager`, `Set-NewsletterManager`, `Remove-NewsletterManager`

#### Examples
```powershell
Add-NewsletterOwner -Identity 'container-id' -User 'owner@contoso.com'

Set-NewsletterWriter -Identity 'container-id' -User 'editor@contoso.com'

Remove-NewsletterReader -Identity 'container-id' -User 'reader@contoso.com'
```

### Security and governance
Use these commands to manage access and policy settings:
- Restricted access control: `Enable-NewsletterAccessControl`, `Disable-NewsletterAccessControl`, `Add-NewsletterAccessControlGroup`, `Remove-NewsletterAccessControlGroup`, `Clear-NewsletterAccessControlGroups`
- Download restrictions: `Block-NewsletterDownload`, `Block-NewsletterDownloadExceptOwners`, `Unblock-NewsletterDownload`
- Tenant search: `Enable-NewsletterTenantSearch`, `Disable-NewsletterTenantSearch`, `Get-NewsletterTenantSearch`
- Sensitivity labels: `Set-NewsletterSensitivityLabel`, `Get-NewsletterSensitivityLabel`, `Remove-NewsletterSensitivityLabel`
- Sharing domains: `Allow-NewsletterSharingDomains`, `Block-NewsletterSharingDomains`, `Get-NewsletterSharingDomains`, `Disable-NewsletterSharingDomains`

#### Examples
```powershell
Enable-NewsletterAccessControl -Identity 'container-id'

Get-NewsletterTenantSearch -Identity 'container-id'

Get-NewsletterSensitivityLabel -Identity 'container-id'

Get-NewsletterSharingDomains -Identity 'container-id'
```

---

## Command Reference Highlights

The module contains many parallel commands for Loop, Designer, and Outlook Newsletters. The patterns below help both business and technical readers understand how to use the module.

### Get commands
Discovery commands typically support an optional `-Identity` parameter.

#### Example syntax
```powershell
Get-Loop [[-Identity] <string>]
Get-Designer [[-Identity] <string>]
Get-Newsletter [[-Identity] <string>]
Get-DeletedLoop [[-Identity] <string>]
Get-DeletedDesigner [[-Identity] <string>]
Get-DeletedNewsletter [[-Identity] <string>]
```

### Role management commands
Role commands typically require:
- `-Identity` as the target container
- `-User` as the user email or login name

#### Example syntax
```powershell
Add-LoopOwner -Identity <string> -User <string>
Set-LoopReader -Identity <string> -User <string>
Remove-DesignerManager -Identity <string> -User <string>
Add-NewsletterOwner -Identity <string> -User <string>
```

### Configuration commands
Configuration commands generally require `-Identity` and may support confirmation behavior.

#### Example syntax
```powershell
Enable-LoopAccessControl -Identity <string>
Disable-DesignerTenantSearch -Identity <string>
Enable-NewsletterAccessControl -Identity <string>
Remove-Loop -Identity <string> [-WhatIf] [-Confirm]
```

---

## Outputs
Output types depend on the underlying SharePoint Online cmdlets invoked by each function.

In practice, this module emits:
- SharePoint Online container objects for discovery commands such as `Get-Loop`, `Get-Designer`, `Get-Newsletter`, `Get-DeletedLoop`, `Get-DeletedDesigner`, and `Get-DeletedNewsletter`
- Setting summary objects for commands such as `Get-LoopTenantSearch`, `Get-LoopSensitivityLabel`, `Get-LoopSharingDomains`, `Get-DesignerTenantSearch`, `Get-DesignerSensitivityLabel`, `Get-DesignerSharingDomains`, `Get-NewsletterTenantSearch`, `Get-NewsletterSensitivityLabel`, and `Get-NewsletterSharingDomains`
- Underlying SPO user-command results for membership changes such as `Add-*`, `Set-*`, and `Remove-*` role commands
- No output for some update and delete operations unless the underlying cmdlet returns data

Because the module is a wrapper around SharePoint Online container cmdlets, technicians should validate output in their tenant with:

```powershell
Get-Newsletter -Identity 'container-id' | Format-List *
```

---

## Error Handling and Operational Behavior

### Validation behavior
The module uses standard PowerShell parameter validation such as:
- `[ValidateNotNullOrEmpty()]`
- `[AllowNull()]`
- `[AllowEmptyString()]`
- `[ValidateSet(...)]`

This means invalid or missing required values are rejected by PowerShell before the command body runs.

### Missing container handling
Internal helper functions first resolve the target container. If the expected Loop, Designer, or Outlook Newsletter container is not found, the module throws a terminating error indicating the target container was not found.

### WhatIf and Confirm support
Destructive or configuration-changing commands use PowerShell `ShouldProcess` patterns.

Examples include:
- `Remove-Loop`
- `Enable-LoopAccessControl`
- `Enable-DesignerAccessControl`
- `Enable-NewsletterAccessControl`
- helper-backed update commands that call `Set-SPOContainer`

This means administrators can safely preview changes with `-WhatIf` when supported.

#### Example
```powershell
Remove-Newsletter -Identity 'container-id' -WhatIf
```

### Pipeline behavior
Based on the public function definitions reviewed, parameters are not explicitly decorated for pipeline input. For most commands, pipeline input should be treated as **not supported** unless you wrap input in your own automation logic.

---

## Technician Quick Start

### 1. Import the module
```powershell
Import-Module .\M365.AppContainers.psd1
```

### 2. List available commands
```powershell
Get-Command -Module M365.AppContainers
```

### 3. Discover Loop, Designer, and Outlook Newsletter containers
```powershell
Get-Loop
Get-Designer
Get-Newsletter
```

### 4. Review a specific setting
```powershell
Get-LoopTenantSearch -Identity 'container-id'
Get-DesignerSensitivityLabel -Identity 'container-id'
Get-NewsletterSharingDomains -Identity 'container-id'
```

### 5. Make controlled changes
```powershell
Enable-LoopAccessControl -Identity 'container-id' -WhatIf
Enable-NewsletterAccessControl -Identity 'container-id' -WhatIf
Remove-Loop -Identity 'container-id' -WhatIf
```

---

## Practical Examples

### Example: review a Loop container, then assign an owner
```powershell
Get-Loop -Identity 'container-id'
Add-LoopOwner -Identity 'container-id' -User 'owner@contoso.com'
```

### Example: check Designer sharing restrictions
```powershell
Get-DesignerSharingDomains -Identity 'container-id'
```

### Example: review Outlook Newsletter sharing restrictions
```powershell
Get-NewsletterSharingDomains -Identity 'container-id'
```

### Example: disable tenant-wide search visibility for a Loop container
```powershell
Disable-LoopTenantSearch -Identity 'container-id'
```

### Example: remove a container safely
```powershell
Remove-Designer -Identity 'container-id' -WhatIf
```

---

## Notes for Administrators
- Use a connected SharePoint Online administrative session before running these commands.
- Test changes in a non-production or low-risk environment first.
- Prefer `-WhatIf` for delete or policy-changing actions where supported.
- Keep the module manifest export list aligned with public function files.
- The module is structured by workload: `Public/Loop`, `Public/Designer`, and `Public/Newsletter`.

---

## Module Structure

```text
M365.AppContainers.psd1
M365.AppContainers.psm1
Private/
Public/Loop/
Public/Designer/
Public/Newsletter/
```

The root module loads private helper functions first, then dot-sources public commands from workload folders, and exports those public functions.

---

## Summary
`M365.AppContainers` gives Microsoft 365 administrators a focused PowerShell interface for governing **Loop**, **Designer**, and **Outlook Newsletter** SharePoint Online containers. For business teams, that means more consistent governance and reduced operational friction. For technicians, it provides a predictable set of commands for discovery, lifecycle actions, membership updates, and security configuration.
