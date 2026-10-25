# LX

![LX preview](https://github.com/LXExplorer/LX/blob/main/preview.png?raw=true)

LX is a debugging explorer

### Tools

| Tool | Purpose |
| --- | --- |
| Script Viewer | Inspect accessible scripts and their contents |
| 3D Viewer | Inspect models and other 3D objects |
| Notepad | Keep notes while exploring |
| Hook | Monitor remote activity and inspect supported remote communication |

### Export and dumping

Depending on executor capabilities, LX can also:

- Save the current place
- Dump scripts
- Export the game tree
- Dump remotes and nil instances
- Export bytecode
- Inspect and export attributes and tags

This is intentionally capability-dependent. Some features only work when the executor exposes the right APIs.

### Themes

LX ships with several built-in themes and supports custom theme imports:

- 2021 Studio
- Everforest
- Github Dark 

## Repository

- [Loader.lua](Loader.lua) - Fetches the public library and loads the main script when needed
- [LX.lua](LX.lua) - The main explorer implementation
- [lib/LX.lua](lib/LX.lua) - Library API for plugin development
- [plugins/](plugins) - Included plugins
- [examples/](examples) - Example plugin and loader scripts
- [docs/Plugins.md](docs/Plugins.md) - Plugin authoring notes

## LX's Loader

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

## Included plugins

| Plugin | File | What it does |
| --- | --- | --- |
| Quick Search | [plugins/QuickSearch.lua](plugins/QuickSearch.lua) | Adds quick buttons for common classes such as parts, models, folders, sounds, and tools |
| Copy Paths | [plugins/CopyPaths.lua](plugins/CopyPaths.lua) | Adds a right-click option to copy selected objects' full names |
| Place Info | [plugins/PlaceInfo.lua](plugins/PlaceInfo.lua) | Shows place and universe details from the current game |

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

## Notes

- [docs/Plugins.md](docs/Plugins.md) covers plugin authoring in more detail.
- [examples/MyPlugin.lua](examples/MyPlugin.lua) is the smallest practical starting point for a custom plugin.
- [CHANGELOG.md](CHANGELOG.md) has the project history and the public repo notes.
- There is not a full plugin unload API yet. If you need a clean slate, restart the session.
  

Discord: https://discord.gg/x3eUsw4vdH

Note: LX is discontinued but the bounty hunter is still on-going so report bugs to us in the Discord server to get a special badge!
