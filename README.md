1| # LX
2| 
3| Discord: https://discord.gg/x3eUsw4vdH
4| 
5| Note: LX is discontinued but the bounty hunter is still ongoing, so report bugs to us in the Discord server to get a special badge.
6| 
7| LX is a debugging explorer.
8| 
9| ![LX](LX.png)
10| 
11| ### Tools
12| 
13| - Script Viewer
14| - 3D Viewer
15| - Notepad
16| - Hook
17| 
18| ### Export and dumping
19| 
20| Depending on executor capabilities, LX can also:
21| 
22| - Save the current place
23| - Dump scripts
24| - Export the game tree
25| - Dump remotes and nil instances
26| - Export bytecode
27| - Inspect and export attributes and tags
28| 
29| This is intentionally capability-dependent. Some features only work when the executor exposes the right APIs.
30| 
31| ## Repository
32| 
33| - [Loader.lua](Loader.lua) - Fetches the public library and loads the main script when needed
34| - [LX.lua](LX.lua) - The main explorer implementation
35| - [lib/LX.lua](lib/LX.lua) - Library API for plugin development
36| - [plugins/](plugins) - Included plugins
37| - [examples/](examples) - Example plugin and loader scripts
38| - [docs/Plugins.md](docs/Plugins.md) - Plugin authoring notes
39| 
40| ## LX's Loader
41| 
42| ```lua
43| local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LXExplorer/LX/main/Loader.lua"))()
44| ```
45| 
46| That loads the library and sets up the main explorer if it is not already running. The loader also exposes the library as `_G.LXLibrary`.
47| 
48| To load the example plugins that ship with the repo:
49| 
49| ```lua
50| local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LXExplorer/LX/main/Loader.lua"))()
51| Library.LoadPlugin("plugins/QuickSearch.lua")
52| Library.LoadPlugin("plugins/CopyPaths.lua")
53| Library.LoadPlugin("plugins/PlaceInfo.lua")
54| ```
55| 
56| See [examples/LoadPlugins.lua](examples/LoadPlugins.lua) for the same pattern in a single file.
57| 
58| ## Included plugins
59| 
60| - Quick Search
61| - Copy Paths
62| - Place Info
63| 
64| ## Plugin API
65| 
66| The plugin system is intentionally small and straightforward. The library exposes a few hooks:
67| 
68| ```lua
69| local Library = loadstring(readfile("lib/LX.lua"))()
70| local plugin = loadstring(readfile("examples/MyPlugin.lua"))()
71| plugin(Library)
72| ```
73| 
74| A plugin file should return a function that receives the library. The authoritative notes live in [docs/Plugins.md](docs/Plugins.md), but the main API surface is:
75| 
76| - `Library.Register(name, setup)`
77| - `Library.AddApp({ name = "My App", icon = "Folder", open = function() end })`
|78| - `Library.AddMenu(callback)`
|79| - `Library.Search(text)`
|80| - `Library.Select(instance)`
|81| - `Library.Theme(name, colors)`
|82| - `Library.LoadPlugin("plugins/QuickSearch.lua")`
|83| 
84| The loader is not a second explorer. It is a thin way to pull and run the real script while giving plugins a library to work with.
85| 
86| ## Notes
87| 
88| - [docs/Plugins.md](docs/Plugins.md) covers plugin authoring in more detail.
89| - [examples/MyPlugin.lua](examples/MyPlugin.lua) is the smallest practical starting point for a custom plugin.
90| - [CHANGELOG.md](CHANGELOG.md) has the project history and the public repo notes.
91| - There is not a full plugin unload API yet. If you need a clean slate, restart the session.
92| 
