<div align="center">
  <img src="LX.png" width="180" height="180" alt="LX logo" />
  <h1>LX</h1>
  <p>
    <strong>Powerful debugging explorer for Roblox</strong>
  </p>
  <p>
    <a href="https://discord.gg/x3eUsw4vdH">
      <img src="https://img.shields.io/badge/Discord-Join%20Server-5865F2?logo=discord&logoColor=white" alt="Discord" />
    </a>
    <a href="https://github.com/LXExplorer/LX">
      <img src="https://img.shields.io/badge/Language-Lua-2C2D72?logo=lua&logoColor=white" alt="Lua" />
    </a>
    <a href="https://github.com/LXExplorer/LX">
      <img src="https://img.shields.io/badge/Status-Discontinued-FF6B6B" alt="Status" />
    </a>
  </p>
</div>

LX is a debugging suite designed to compete with Dex Explorer in celebration of the fencing incident. It focuses on inspection, script analysis, object traversal, and debugging workflows useful when you need more visibility into a running Roblox experience.

> Note: LX is discontinued, but the bounty hunter is still ongoing. If you find issues, report them in the Discord server to receive a special badge.

<div align="center">
  <img src="preview.png" width="960" alt="LX preview" />
</div>

## Why LX?

LX includes a compact but useful set of tools for exploring scripts and instances in a running place. It is designed to give you a cleaner debugging workflow without sacrificing speed or usability.

### Core tools

- Script Viewer
- 3D Viewer
- Notepad
- Hook

### Export and dumping

Depending on executor capabilities, LX can also:

- Save the current place
- Dump scripts
- Export the game tree
- Dump remotes and nil instances
- Export bytecode
- Inspect and export attributes and tags

This feature set is intentionally capability-dependent. Some actions only work when the executor exposes the right APIs.

## Quick start

Load the library with the project loader:

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LXExplorer/LX/main/Loader.lua"))()
```

That loads the library and sets up the main explorer if it is not already running. The loader also exposes the library as `_G.LXLibrary`.

To load the example plugins that ship with the repo:

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LXExplorer/LX/main/Loader.lua"))()
Library.LoadPlugin("plugins/QuickSearch.lua")
Library.LoadPlugin("plugins/CopyPaths.lua")
Library.LoadPlugin("plugins/PlaceInfo.lua")
```

See [examples/LoadPlugins.lua](examples/LoadPlugins.lua) for the same pattern in a single file.

## Repository layout

- [Loader.lua](Loader.lua) — fetches the public library and runs the main script when needed
- [LX.lua](LX.lua) — the main explorer implementation
- [lib/LX.lua](lib/LX.lua) — library API for plugin development
- [plugins/](plugins) — bundled plugins
- [examples/](examples) — example loader and plugin scripts
- [docs/Plugins.md](docs/Plugins.md) — plugin authoring notes

## Included plugins

- Quick Search
- Copy Paths
- Place Info

## Plugin API

The plugin system is intentionally small and straightforward. The library exposes a few hooks:

```lua
local Library = loadstring(readfile("lib/LX.lua"))()
local plugin = loadstring(readfile("examples/MyPlugin.lua"))()
plugin(Library)
```

A plugin file should return a function that receives the library. The authoritative notes live in [docs/Plugins.md](docs/Plugins.md), but the main API surface is:

- `Library.Register(name, setup)`
- `Library.AddApp({ name = "My App", icon = "Folder", open = function() end })`
- `Library.AddMenu(callback)`
- `Library.Search(text)`
- `Library.Select(instance)`
- `Library.Theme(name, colors)`
- `Library.LoadPlugin("plugins/QuickSearch.lua")`

The loader is not a second explorer. It is a thin way to pull and run the real script while giving plugins a library to work with.

## Feature highlights

### Script inspection

Inspect script contents and object properties with a UI tuned for quick debugging and triage.

### Place and instance traversal

Browse the current game tree and drill into instances without losing context while testing your code.

### Lightweight plugin system

Add custom extensions, custom menus, and extra tooling without rewriting the base explorer.

## Notes

- [docs/Plugins.md](docs/Plugins.md) covers plugin authoring in more detail.
- [examples/MyPlugin.lua](examples/MyPlugin.lua) is the smallest practical starting point for a custom plugin.
- [CHANGELOG.md](CHANGELOG.md) contains the project history and public repo notes.
- There is not a full plugin unload API yet. If you need a clean slate, restart the session.

<div align="center">
  <p>
    <a href="https://discord.gg/x3eUsw4vdH">
      <img src="https://img.shields.io/badge/Discord-Join%20the%20server-5865F2?logo=discord&logoColor=white" alt="Discord" />
    </a>
    <a href="https://github.com/LXExplorer/LX/issues">
      <img src="https://img.shields.io/badge/Issues-Report%20bugs-181717?logo=github" alt="Issues" />
    </a>
  </p>
</div>
