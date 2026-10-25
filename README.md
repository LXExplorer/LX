1| <div align="center">
2|   <img src="LX.png" width="180" height="180" alt="LX logo" />
3|   <h1>LX</h1>
4|   <p>
5|     <strong>Powerful debugging explorer for Roblox</strong>
6|   </p>
7|   <p>
8|     <a href="https://discord.gg/x3eUsw4vdH">
9|       <img src="https://img.shields.io/badge/Discord-Join%20Server-5865F2?logo=discord&logoColor=white" alt="Discord" />
10|     </a>
11|     <a href="https://github.com/LXExplorer/LX">
12|       <img src="https://img.shields.io/badge/Language-Lua-2C2D72?logo=lua&logoColor=white" alt="Lua" />
13|     </a>
14|     <a href="https://github.com/LXExplorer/LX">
15|       <img src="https://img.shields.io/badge/Status-Discontinued-FF6B6B" alt="Status" />
16|     </a>
17|   </p>
18| </div>
19| 
20| LX is a debugging suite designed to compete with Dex Explorer in celebration of the fencing incident.
21| 
22| <div align="center">
23|   <img src="AllKnowing.gif" width="960" alt="LX For The All Knowing" />
24| </div>
| 
25| ## LX For The All Knowing
26| 
27| LX For The All Knowing is the private, tester-only evolution of LX. It is the version built for people who are trusted to push the project forward, with stronger tooling, faster response times, and ongoing maintenance to keep the project from rotting.
| 
28| This build is meant to flex the premium side of LX without pretending it is the public release. It includes:
29| 
30| - Script editing
31| - Datastore inspection and management
32| - Secret viewer
33| - Better 3D viewer
34| - 5 strong built-in plugins
35| - Priority support
36| - Constant updates and maintenance
37| - Access restricted to approved testers and high-contribution contributors
38| 
39| In short: this is LX at its most capable, for the people who have earned trust and are helping keep the project alive.
40| 
41| > Note: LX is discontinued, but the bounty hunter is still ongoing. If you find issues, report them in the Discord server to receive a special badge.
42| 
43| <div align="center">
44|   <img src="preview.png" width="960" alt="LX preview" />
45| </div>
46| 
47| 
48| ### Tools
49| 
50| - Script Viewer
51| - 3D Viewer
52| - Notepad
53| - Hook
54| 
55| ### Export and dumping
56| 
57| Depending on executor capabilities, LX can also:
58| 
59| - Save the current place
60| - Dump scripts
61| - Export the game tree
62| - Dump remotes and nil instances
63| - Export bytecode
64| - Inspect and export attributes and tags
65| 
66| This feature set is intentionally capability-dependent. Some actions only work when the executor exposes the right APIs.
67| 
68| ## Quick start
69| 
70| Load the library with the project loader:
71| 
72| ```lua
73| local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LXExplorer/LX/main/Loader.lua"))()
74| ```
75| 
76| That loads the library and sets up the main explorer if it is not already running. The loader also exposes the library as `_G.LXLibrary`.
77| 
78| To load the example plugins that ship with the repo:
79| 
80| ```lua
81| local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LXExplorer/LX/main/Loader.lua"))()
82| Library.LoadPlugin("plugins/QuickSearch.lua")
83| Library.LoadPlugin("plugins/CopyPaths.lua")
84| Library.LoadPlugin("plugins/PlaceInfo.lua")
85| ```
86| 
87| See [examples/LoadPlugins.lua](examples/LoadPlugins.lua) for the same pattern in a single file.
88| 
89| ## Repository layout
90| 
91| - [Loader.lua](Loader.lua) — fetches the public library and runs the main script when needed
92| - [LX.lua](LX.lua) — the main explorer implementation
93| - [lib/LX.lua](lib/LX.lua) — library API for plugin development
94| - [plugins/](plugins) — bundled plugins
95| - [examples/](examples) — example loader and plugin scripts
96| - [docs/Plugins.md](docs/Plugins.md) — plugin authoring notes
97| 
98| ## Included plugins
99| 
100| - Quick Search
101| - Copy Paths
102| - Place Info
103| 
104| ## Plugin API
105| 
106| The plugin system is intentionally small and straightforward. The library exposes a few hooks:
107| 
108| ```lua
109| local Library = loadstring(readfile("lib/LX.lua"))()
110| local plugin = loadstring(readfile("examples/MyPlugin.lua"))()
111| plugin(Library)
112| ```
113| 
114| A plugin file should return a function that receives the library. The authoritative notes live in [docs/Plugins.md](docs/Plugins.md), but the main API surface is:
115| 
116| - `Library.Register(name, setup)`
117| - `Library.AddApp({ name = "My App", icon = "Folder", open = function() end })`
118| - `Library.AddMenu(callback)`
119| - `Library.Search(text)`
120| - `Library.Select(instance)`
121| - `Library.Theme(name, colors)`
122| - `Library.LoadPlugin("plugins/QuickSearch.lua")`
123| 
124| The loader is not a second explorer. It is a thin way to pull and run the real script while giving plugins a library to work with.
125| 
126| ## Feature highlights
127| 
128| ### Script inspection
129| 
130| Inspect script contents and object properties with a UI tuned for quick debugging and triage.
131| 
132| ### Place and instance traversal
133| 
134| Browse the current game tree and drill into instances without losing context while testing your code.
135| 
136| ### Lightweight plugin system
137| 
138| Add custom extensions, custom menus, and extra tooling without rewriting the base explorer.
139| 
140| ## Notes
141| 
142| - [docs/Plugins.md](docs/Plugins.md) covers plugin authoring in more detail.
143| - [examples/MyPlugin.lua](examples/MyPlugin.lua) is the smallest practical starting point for a custom plugin.
144| - [CHANGELOG.md](CHANGELOG.md) contains the project history and public repo notes.
145| - There is not a full plugin unload API yet. If you need a clean slate, restart the session.
146| 
147| <div align="center">
148|   <p>
149|     <a href="https://discord.gg/x3eUsw4vdH">
150|       <img src="https://img.shields.io/badge/Discord-Join%20the%20server-5865F2?logo=discord&logoColor=white" alt="Discord" />
151|     </a>
152|     <a href="https://github.com/LXExplorer/LX/issues">
153|       <img src="https://img.shields.io/badge/Issues-Report%20bugs-181717?logo=github" alt="Issues" />
154|     </a>
155|   </p>
156| </div>
157| 
