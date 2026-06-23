# loop-admin

PowerShell module for Microsoft 365 IT administrators to manage Loop containers and container users through concise wrappers around SharePoint Online Management Shell cmdlets.

## Overview

`loop-admin` provides short, self-explanatory commands to:

- Discover Loop containers
- Filter Loop containers by archive state
- Remove Loop containers
- Add, set, and remove container users by role

The module is designed as a thin wrapper over SharePoint Online Management Shell cmdlets and returns standard SharePoint Online objects whenever the underlying cmdlets do so.

## Prerequisites

- SharePoint Online Management Shell installed
- Existing tenant connection established with `Connect-SPOService`

## Loop detection rule

Loop containers are identified by:

- `OwningApplicationName -eq 'Loop'`

When an `Identity` parameter is used, the module first retrieves the container through `Get-SPOContainer -Identity` and then evaluates whether the returned container belongs to Loop.

## Commands by activity

### Container

- `Get-Loop`
- `Get-LoopArchived`
- `Get-LoopRecentlyArchived`
- `Get-LoopFullyArchived`
- `Get-LoopReactivating`
- `Get-LoopNotArchived`
- `Remove-Loop`

### Users

#### Add
- `Add-LoopOwner`
- `Add-LoopReader`
- `Add-LoopWriter`
- `Add-LoopManager`

#### Set
- `Set-LoopOwner`
- `Set-LoopReader`
- `Set-LoopWriter`
- `Set-LoopManager`

#### Remove
- `Remove-LoopOwner`
- `Remove-LoopReader`
- `Remove-LoopWriter`
- `Remove-LoopManager`

## Examples

### List all Loop containers

```powershell
Get-Loop
```

### Get one Loop container

```powershell
Get-Loop -Identity 'container-id'
```

### List archived Loop containers

```powershell
Get-LoopArchived
```

### Remove a Loop container

```powershell
Remove-Loop -Identity 'container-id'
```

### Add a writer to a Loop container

```powershell
Add-LoopWriter -Identity 'container-id' -User 'user@contoso.com'
```

### Set a manager in a Loop container

```powershell
Set-LoopManager -Identity 'container-id' -User 'manager@contoso.com'
```

### Remove a reader from a Loop container

```powershell
Remove-LoopReader -Identity 'container-id' -User 'user@contoso.com'
```

## Suggested structure for future extension

```text
loop-admin/
├── loop-admin.psm1
├── README.md
├── reasoning.md
├── container/
│   ├── Get-Loop.ps1
│   ├── Get-LoopArchived.ps1
│   ├── Get-LoopRecentlyArchived.ps1
│   ├── Get-LoopFullyArchived.ps1
│   ├── Get-LoopReactivating.ps1
│   ├── Get-LoopNotArchived.ps1
│   └── Remove-Loop.ps1
└── users/
    ├── add/
    ├── set/
    └── remove/
```

This release keeps implementation in a single module file for portability, while the documented layout shows how commands can be split into independent files by activity in a future refactor.
