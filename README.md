<div align="center">
  <img src="LX.png" width="180" height="180" alt="LX logo" />
  <h1>LX</h1>
  <p>
    <strong>a cool lil explorer for Roblox debugging</strong>
  </p>
  <p>
    <a href="https://discord.gg/x3eUsw4vdH">
      <img src="https://img.shields.io/badge/Discord-Join%20the%20server-5865F2?logo=discord&logoColor=white" alt="Discord" />
    </a>
    <a href="https://github.com/LXExplorer/LX">
      <img src="https://img.shields.io/badge/Language-Lua-2C2D72?logo=lua&logoColor=white" alt="Lua" />
    </a>
    <a href="https://github.com/LXExplorer/LX">
      <img src="https://img.shields.io/badge/Status-Discontinued-FF6B6B" alt="Status" />
    </a>
  </p>
</div>

LX is a Roblox debugging suite inspired by Dex Explorer. It is built for poking around games, scripts, and instances without making everything feel like a chore.

The Discord server is where people hang out, test things out, report bugs, and share what they are working on.

> [!IMPORTANT]
> LX is discontinued, but the bounty hunter is still going. If you find issues, report them in the Discord server and you might get a special badge.

> [!WARNING]
> This project is mainly for educational and debugging use. Some features depend on executor capabilities and may not work everywhere.

<div align="center">
  <img src="preview.png" width="960" alt="LX preview" />
</div>

## what it does

- Script Viewer
- 3D Viewer
- Notepad
- Hook
- Game tree and instance browsing
- Script and place dumping when your executor allows it
- Remote, nil instance, attribute, tag, and bytecode export

## quick start

Load the library with the project loader:

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LXExplorer/LX/main/Loader.lua"))()
```

That loads the library and opens the main explorer if it is not already running. It also exposes the library as `_G.LXLibrary`.

To load the bundled example plugins:

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LXExplorer/LX/main/Loader.lua"))()
Library.LoadPlugin("plugins/QuickSearch.lua")
Library.LoadPlugin("plugins/CopyPaths.lua")
Library.LoadPlugin("plugins/PlaceInfo.lua")
```

See [examples/LoadPlugins.lua](examples/LoadPlugins.lua) for the same pattern in one file.

## repo layout

- [Loader.lua](Loader.lua) is the tiny loader that grabs the public library and runs the main script when needed
- [LX.lua](LX.lua) is the main explorer implementation
- [lib/LX.lua](lib/LX.lua) is the library API for plugin development
- [plugins/](plugins) has the bundled plugins
- [examples/](examples) has example loaders and plugin scripts
- [docs/Plugins.md](docs/Plugins.md) has the plugin authoring notes

## included plugins

- Quick Search
- Copy Paths
- Place Info

## plugin API

The plugin system is small and simple. The library exposes a few hooks:

```lua
local Library = loadstring(readfile("lib/LX.lua"))()
local plugin = loadstring(readfile("examples/MyPlugin.lua"))()
plugin(Library)
```

A plugin file should return a function that receives the library. The real notes live in [docs/Plugins.md](docs/Plugins.md), but the main API surface is:

- `Library.Register(name, setup)`
- `Library.AddApp({ name = "My App", icon = "Folder", open = function() end })`
- `Library.AddMenu(callback)`
- `Library.Search(text)`
- `Library.Select(instance)`
- `Library.Theme(name, colors)`
- `Library.LoadPlugin("plugins/QuickSearch.lua")`

The loader is not a second explorer. It is a thin way to pull and run the real script while giving plugins a library to work with.

## a few notes

- [docs/Plugins.md](docs/Plugins.md) has more plugin details
- [examples/MyPlugin.lua](examples/MyPlugin.lua) is the simplest place to start a custom plugin
- There is not a full plugin unload API yet. If you need a clean slate, restart the session

<div align="center">
  <img src="AllKnowing.gif" width="420" alt="LX For The All Knowing" />
</div>

## LX For The All Knowing

This is the private tester version of LX. It is for trusted users, contributors, and people with access to the stronger build.

It includes:

- Script editing
- Datastore inspection and management
- Secret viewer
- Better 3D viewer
- 5 built in plugins
- Priority support
- Regular updates to keep the project from rotting

This is the more powerful version of LX, kept for the people trusted to keep it alive.
