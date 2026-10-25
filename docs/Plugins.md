# Plugins

Run LX first. `examples/LoadPlugins.lua` starts it through the loader and adds the three included plugins. It reads files from this repo on GitHub, so upload everything first. The loader uses the `main` branch. If yours has a different name, change the URLs before running it.

Quick Search adds buttons for parts, models, folders, sounds and tools. Copy Paths adds a right click option for copying selected objects' full names. Place Info shows the place ID, universe ID, player count and workspace object count with a refresh button.

A plugin file returns a function that receives the library. `examples/MyPlugin.lua` is a small starting point. Run your own local file like this after LX is open:

```lua
local Library = loadstring(readfile("lib/LX.lua"))()
local plugin = loadstring(readfile("examples/MyPlugin.lua"))()
plugin(Library)
```

Those paths are inside your executor's workspace, not your Downloads folder. Put the files there first. This needs `readfile` and `loadstring`.

`Library.Register(name, setup)` calls your setup with the running LX API and the library. A name only registers once per library instance and LX session. Keep the same Library value when loading several plugins.

`Library.AddApp({ name = "My App", icon = "Folder", open = function() end })` adds an app button. `api.apps.window(name, title)` makes a window with a body you can put controls in. Call `window.show()` to open it. `api.apps.button(parent, text, order)` makes a button.

`Library.AddMenu(callback)` adds a right click hook. The callback gets `selected, selection, item, separator`. Call `item(text, shortcut, enabled, callback)` to add an option. The returned function removes your hook when called.

`Library.Search(text)` searches the explorer. `Library.Select(instance)` selects and reveals an object. `Library.Theme(name, colors)` copies the current theme, replaces the colors you give it and applies it for this session. The theme example doesn't save anything to disk.

`Library.LoadPlugin("plugins/QuickSearch.lua")` reads a plugin from this repo and runs it. Nothing gets loaded automatically except LX itself when you use Loader.lua. Read a plugin before running it. Plugins run with your executor's access, not in a sandbox.

The library wraps the existing `_G.Delve` API. It isn't a second copy of the explorer. LX.lua is still the complete original public script and works by itself.

There isn't a full unload button for plugins yet. A menu hook can be removed, but apps don't have a removal API. Start a fresh session if you need everything cleared.

Put your plugins in a public repo and share them in [LX's server](https://discord.gg/ygMePuFfYF). Tell people what they do and what they need. Don't include the private version.
