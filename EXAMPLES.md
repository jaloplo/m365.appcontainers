# M365.AppContainers Examples

## Overview
This document provides practical examples for the `M365.AppContainers` module. The examples focus on common administration tasks for **Loop**, **Designer**, and **Outlook Newsletters** containers in SharePoint Online.

These examples are useful because they help administrators:
- discover app containers quickly
- apply governance settings consistently
- delegate access using clear role assignments
- control sharing, download, search, and labeling behavior
- perform administrative changes more safely with `-WhatIf` where supported

> Before running these commands, connect to the SharePoint Online administration tooling required by the underlying `SPO` container cmdlets.

---

## Import the module

```powershell
Import-Module .\M365.AppContainers.psd1
```

**Why this is useful:**  
Loads all Loop, Designer, and Newsletter administration commands into the current session so you can manage Microsoft 365 app containers from one place.

---

## Discovering containers

### List all Loop containers

```powershell
Get-Loop
```

**Use case:**  
An administrator wants to review all Loop containers in the tenant before applying governance settings.

**Why this is useful:**  
This is the quickest way to inventory Loop-backed SharePoint Online app containers and identify targets for cleanup, access reviews, or policy changes.

### Get a specific Loop container by identity

```powershell
Get-Loop -Identity 'container-id'
```

**Use case:**  
You already know the container ID and want to inspect one specific Loop container.

**Why this is useful:**  
It narrows the result to a single target, which is safer and more efficient when validating settings before making changes.

### List all Designer containers

```powershell
Get-Designer
```

**Use case:**  
A governance team needs to review all Designer containers currently provisioned.

**Why this is useful:**  
It helps identify Designer workload usage and gives administrators a starting point for search, sharing, or sensitivity label reviews.

### Get a specific Newsletter container

```powershell
Get-Newsletter -Identity 'container-id'
```

**Use case:**  
A support engineer is troubleshooting one Outlook Newsletter container reported by a business user.

**Why this is useful:**  
Fetching a single container keeps troubleshooting focused and reduces the chance of editing the wrong object.

---

## Ownership and role management

### Add an owner to a Loop container

```powershell
Add-LoopOwner -Identity 'container-id' -User 'owner@contoso.com'
```

**Use case:**  
A new business owner takes responsibility for a Loop workspace and must be granted owner access.

**Why this is useful:**  
Assigning owners supports delegation, reduces operational bottlenecks, and ensures the right person can manage the container.

### Add a writer to a Loop container

```powershell
Add-LoopWriter -Identity 'container-id' -User 'author@contoso.com'
```

**Use case:**  
A project contributor needs write access without being made an owner.

**Why this is useful:**  
It allows controlled collaboration while preserving stronger permissions for administrators or designated owners.

### Set a user as manager for a Designer container

```powershell
Set-DesignerManager -Identity 'container-id' -User 'manager@contoso.com'
```

**Use case:**  
An existing user already has access, but their role needs to be updated to manager.

**Why this is useful:**  
Role changes are common in operational handoffs. This helps keep permissions aligned with current responsibilities.

### Remove a reader from a Newsletter container

```powershell
Remove-NewsletterReader -Identity 'container-id' -User 'reader@contoso.com'
```

**Use case:**  
A user no longer needs access to newsletter content after changing teams.

**Why this is useful:**  
Regularly removing unnecessary access supports least-privilege administration and strengthens governance.

---

## Restricted access control

### Enable restricted access control for a Loop container

```powershell
Enable-LoopAccessControl -Identity 'container-id'
```

**Use case:**  
A sensitive Loop container should be accessible only under controlled access rules.

**Why this is useful:**  
Restricted access control is useful when content requires tighter governance than standard sharing and membership settings alone.

### Add a restricted access control group to a Loop container

```powershell
Add-LoopAccessControlGroup -Identity 'container-id' -Group 'LegalTeam@contoso.com'
```

**Use case:**  
A legal or compliance group must be explicitly included in the restricted access model.

**Why this is useful:**  
Using groups instead of managing many users one by one simplifies administration and improves consistency.

### Clear all restricted access control groups from a Newsletter container

```powershell
Clear-NewsletterAccessControlGroups -Identity 'container-id'
```

**Use case:**  
An administrator wants to reset previously configured access control groups before applying a new model.

**Why this is useful:**  
This is helpful during remediation or governance redesign when old access rules need to be removed cleanly.

---

## Sharing domain restrictions

### Allow sharing only to approved domains for a Loop container

```powershell
Allow-LoopSharingDomains -Identity 'container-id' -Domains 'contoso.com','fabrikam.com'
```

**Use case:**  
A business unit collaborates with one trusted partner and wants to block sharing to any other external domains.

**Why this is useful:**  
This provides a focused allow-list model that reduces accidental oversharing and supports partner-based collaboration.

### Block sharing to specific domains for a Designer container

```powershell
Block-DesignerSharingDomains -Identity 'container-id' -Domains 'blockedexample.com','legacyvendor.com'
```

**Use case:**  
Security policy prohibits collaboration with certain external organizations.

**Why this is useful:**  
A block-list approach helps enforce external sharing boundaries while leaving permitted domains unaffected.

### Review sharing domain settings for a Newsletter container

```powershell
Get-NewsletterSharingDomains -Identity 'container-id'
```

**Use case:**  
An admin needs to verify whether a newsletter container is using allow-list, block-list, or no domain restrictions.

**Why this is useful:**  
Validation commands are important before and after changes so administrators can confirm governance settings are applied as intended.

### Disable sharing domain restrictions for a Loop container

```powershell
Disable-LoopSharingDomains -Identity 'container-id'
```

**Use case:**  
A previously restricted container must return to the default sharing model.

**Why this is useful:**  
It provides a clean rollback path when restrictions are no longer needed.

---

## Download controls

### Block downloads for a Loop container

```powershell
Block-LoopDownload -Identity 'container-id'
```

**Use case:**  
A container stores sensitive information that should not be downloaded to unmanaged devices.

**Why this is useful:**  
Blocking downloads helps reduce data exfiltration risk and supports stronger control over where content is accessed.

### Block Newsletter downloads except for owners

```powershell
Block-NewsletterDownloadExceptOwners -Identity 'container-id'
```

**Use case:**  
A communications team wants contributors to work online, but owners still need the ability to download for approved business processes.

**Why this is useful:**  
This balances security with operational flexibility by preserving download rights only for container owners.

### Remove download restrictions from a Designer container

```powershell
Unblock-DesignerDownload -Identity 'container-id'
```

**Use case:**  
A temporary restriction was applied during an incident or review and now must be lifted.

**Why this is useful:**  
It restores standard access behavior without requiring manual changes through multiple administrative interfaces.

---

## Search visibility

### Check tenant search status for a Loop container

```powershell
Get-LoopTenantSearch -Identity 'container-id'
```

**Use case:**  
An administrator wants to verify whether a Loop container can appear in tenant-wide search.

**Why this is useful:**  
Search visibility affects discoverability, so reviewing this setting is important for both governance and user experience.

### Disable tenant search for a Designer container

```powershell
Disable-DesignerTenantSearch -Identity 'container-id'
```

**Use case:**  
A sensitive container should not be broadly discoverable through search.

**Why this is useful:**  
Reducing discoverability can be an important control for confidential or tightly scoped content.

### Enable tenant search for a Newsletter container

```powershell
Enable-NewsletterTenantSearch -Identity 'container-id'
```

**Use case:**  
A newsletter container contains broadly useful organizational content that should be easy to find.

**Why this is useful:**  
Enabling search improves discoverability for content intended for wide internal access.

---

## Sensitivity labels

### Set a sensitivity label on a Designer container

```powershell
Set-DesignerSensitivityLabel -Identity 'container-id' -SensitivityLabel 'label-guid-or-name'
```

**Use case:**  
A design collaboration space must inherit the correct compliance posture for regulated content.

**Why this is useful:**  
Sensitivity labels help enforce classification, protection, and governance expectations consistently.

### Review the sensitivity label on a Loop container

```powershell
Get-LoopSensitivityLabel -Identity 'container-id'
```

**Use case:**  
An admin wants to verify whether a container is labeled correctly before an audit or access review.

**Why this is useful:**  
Reading the current label helps validate compliance configuration before making further security changes.

### Remove a sensitivity label from a Newsletter container

```powershell
Remove-NewsletterSensitivityLabel -Identity 'container-id'
```

**Use case:**  
A label was assigned incorrectly and must be removed before the correct one is applied.

**Why this is useful:**  
It supports remediation workflows where configuration mistakes must be corrected cleanly.

---

## Lifecycle and cleanup

### List deleted Loop containers

```powershell
Get-DeletedLoop
```

**Use case:**  
An administrator needs to review deleted Loop containers for audit or recovery-related follow-up.

**Why this is useful:**  
Deleted container discovery is useful for cleanup validation and understanding recent lifecycle activity.

### Find archived Newsletter containers

```powershell
Get-NewsletterArchived
```

**Use case:**  
Operations staff want to review newsletter containers that are no longer active.

**Why this is useful:**  
Archived state reporting helps identify stale resources and supports retention or governance planning.

### Remove a Loop container safely with `-WhatIf`

```powershell
Remove-Loop -Identity 'container-id' -WhatIf
```

**Use case:**  
Before deleting a container, an administrator wants to confirm what would happen without making the change.

**Why this is useful:**  
`-WhatIf` reduces risk for destructive actions and should be part of normal administrative practice when available.

### Remove a Designer container

```powershell
Remove-Designer -Identity 'container-id'
```

**Use case:**  
A container is no longer needed and has passed the organization’s review and approval process for deletion.

**Why this is useful:**  
This supports lifecycle cleanup, reduces clutter, and helps keep the tenant manageable over time.

---

## Practical administrative workflows

### Workflow: Review a Loop container and assign a new owner

```powershell
Get-Loop -Identity 'container-id'
Add-LoopOwner -Identity 'container-id' -User 'new.owner@contoso.com'
Get-LoopPrincipalOwner -Identity 'container-id'
```

**Use case:**  
A service desk engineer is handling a request to transfer responsibility for a Loop container.

**Why this is useful:**  
This workflow helps validate the target, make the ownership change, and confirm the result as part of a simple handoff process.

### Workflow: Lock down a Newsletter container used for executive communications

```powershell
Enable-NewsletterAccessControl -Identity 'container-id'
Block-NewsletterDownloadExceptOwners -Identity 'container-id'
Disable-NewsletterTenantSearch -Identity 'container-id'
Set-NewsletterSensitivityLabel -Identity 'container-id' -SensitivityLabel 'label-guid-or-name'
```

**Use case:**  
An executive newsletter repository needs tighter controls around visibility, download behavior, and compliance classification.

**Why this is useful:**  
This combines multiple governance controls into a repeatable hardening workflow for sensitive communication content.

### Workflow: Restrict external sharing for a partner-facing Loop container

```powershell
Allow-LoopSharingDomains -Identity 'container-id' -Domains 'contoso.com','partner.com'
Get-LoopSharingDomains -Identity 'container-id'
```

**Use case:**  
A project team collaborates with one approved external partner and wants to ensure no other domains are used.

**Why this is useful:**  
This supports safer external collaboration by enforcing a clearly approved boundary and then verifying the setting.

---

## Notes

- The module requires **PowerShell 5.1** or later according to the module manifest.
- The module wraps SharePoint Online container cmdlets such as `Get-SPOContainer`, `Set-SPOContainer`, `Remove-SPOContainer`, and related user-management commands.
- Many update and removal commands support PowerShell confirmation behavior through `ShouldProcess`, so use `-WhatIf` where appropriate.
- Most commands use explicit parameters such as `-Identity`, `-User`, `-Domains`, and `-SensitivityLabel` rather than pipeline input.

---

## Summary
These examples are designed to show not only **how** to use `M365.AppContainers` commands, but also **when** and **why** they matter in real administration scenarios. They can be used as a quick-start reference for help desk staff, SharePoint administrators, Microsoft 365 engineers, and governance teams managing Loop, Designer, and Outlook Newsletter containers.
