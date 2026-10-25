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

LX is a Roblox debugging tool made for looking around games, scripts, and instances without everything being a mess.

If you want to hang out, ask questions, or see what people are messing with, the Discord server is the place.

> [!IMPORTANT]
> LX is discontinued, but the bounty hunter is still going. If you find issues, report them in the Discord server and you might get a special badge.

> [!WARNING]
> This is mainly for educational and debugging use. Some features depend on what your executor can do, so they may not work everywhere.

<div align="center">
  <img src="preview.png" width="960" alt="LX preview" />
</div>

## what it does

LX helps you inspect stuff in a Roblox game, like:

- script contents
- instance tree
- 3D viewer
- notepad
- hooks
- dumping scripts and places when your executor supports it
- exporting remotes, attributes, tags, and bytecode

You do not need to be a dev wizard to use it. If it loads and runs, you can start poking around.

## how to load it

Copy this into your executor:

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LXExplorer/LX/main/Loader.lua"))()
```

That loads the library and opens the main explorer if it is not already running.

If you want to use the example plugins that come with the repo, do this:

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LXExplorer/LX/main/Loader.lua"))()
Library.LoadPlugin("plugins/QuickSearch.lua")
Library.LoadPlugin("plugins/CopyPaths.lua")
Library.LoadPlugin("plugins/PlaceInfo.lua")
```

## easy stuff to know

- The loader is just the thing that grabs the main explorer and gets it running.
- The explorer is the real tool you use.
- Plugins add extra tools and shortcuts.
- Some features will only work if your executor exposes that capability.

## built in plugins

- Quick Search
- Copy Paths
- Place Info

## if you want to make your own plugin

The repo has a small plugin system. You can start from the example files in the repo and change them.

Basic example:

```lua
local Library = loadstring(readfile("lib/LX.lua"))()
local plugin = loadstring(readfile("examples/MyPlugin.lua"))()
plugin(Library)
```

The full notes are in [docs/Plugins.md](docs/Plugins.md).

## repo layout

- [Loader.lua](Loader.lua) loads the main script
- [LX.lua](LX.lua) is the main explorer
- [lib/LX.lua](lib/LX.lua) is the library API
- [plugins/](plugins) contains the bundled plugins
- [examples/](examples) contains example scripts
- [docs/Plugins.md](docs/Plugins.md) has the deeper plugin notes

## notes

- This project is mostly for learning and debugging.
- Some features depend on executor support.
- If you want a clean slate, restart the session.

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

This is the stronger version of LX for the people trusted to keep it alive.
