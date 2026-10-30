<div align="center">
  <img src="LX.png" width="180" height="180" alt="LX logo" />
  <h1>LX</h1>
  <p>
    <strong>Explorer Suite</strong>
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

LX is a Roblox debugging tool made for exploring ROBLOX games to a high degree

If you want to hang out, ask questions, or get help with LX then visit the Discord server 

> [!WARNING]
> This is mainly for educational and debugging use. Some features depend on what your executor can do, so they MAY not work everywhere!

<div align="center">
  <img src="preview.png" width="960" alt="LX preview" />
</div>

LX helps you inspect stuff in a Roblox game, like:

- Script contents
- instance tree
- 3D viewer
- Notepad
- Hooks
- Dumping scripts and places when your executor supports it
- Exporting remotes, attributes, tags, and bytecode (may be buggy as i am still in the process of rewriting it)



## Main Loader

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LXExplorer/LX/main/Loader.lua"))()
```

If you want to use plugins then put the files in `LX/plugins` and click Reload All in the Plugins app. LX also loads them when it starts.

You can also paste a raw plugin link into Plugin URL and click Install.

## Info

- Plugins add extra tools and shortcuts.
- Some features will only work if your executor exposes that capability as stated.


## For Plugin Devs

LX passes its plugin API into your script. Use `local api = ...` to get it, you dont need to load LX again inside the plugin.

Basic example:

```lua
local api = ...
local ui = api.imgui("my_plugin", "My Plugin")
local title = "My Plugin"
local enabled = true
local width = 380

ui.window.frame.Size = UDim2.fromOffset(width, 320)

ui.render(function(g)
    if enabled then
        g.header(title)
    end

    title = g.input("Title", title)
    enabled = g.checkbox("Show title", enabled)
    width = g.slider("Window width", width, 300, 600, 1)
    g.separator()

    if g.button("Reset") then
        title = "My Plugin"
        enabled = true
        width = 380
    end

    ui.window.frame.Size = UDim2.fromOffset(width, 320)
end)

ui.show()

return {
    unload = function()
        ui.stop()
        ui.window.frame:Destroy()
    end,
}
```

`api.imgui(name, title)` makes a window using LX's plugin ui. `api.ImGui(name, title)` does the same thing.

Inside `ui.render(function(g) ... end)` you can use:

- `g.text(text)` for text
- `g.header(text)` for a title
- `g.separator()` for a divider
- `g.button(text)` returns true when clicked
- `g.checkbox(text, value)` returns the checkbox value
- `g.slider(text, value, min, max, step)` returns the slider value
- `g.input(text, value)` returns the text when you finish editing it

Keep the values outside the render function and assign the returned values like the example does. The render function runs every frame while the window is visible so dont connect events or create instances inside it.

`ui.show()` opens the window, `ui.stop()` stops rendering, and `ui.window` gives you the LX window.

If you want to make your own ui instead then use `local holder, win = api.gui("My Plugin", { size = Vector2.new(380, 280) })` and put your GuiObjects inside `holder`. This opens the window and LX handles it when the plugin is unloaded.

The API also has `api.theme`, `api.selection()`, `api.goTo(instance)`, `api.addApp(app)`, and `api.addMenu(function(...) ... end)` for plugins that need them.

Save your plugin as a `.lua`, `.luau`, or `.txt` file in `LX/plugins` then click Reload All. Return a table with an `unload` function to clean up anything your plugin creates, including any windows made with `api.imgui` and any event connections.

The full notes are in [docs/Plugins.md](docs/Plugins.md).

## Hierarchy

- [Loader.lua](Loader.lua) loads the main script
- [LX.lua](LX.lua) is the main explorer
- [lib/LX.lua](lib/LX.lua) is the library API
- [plugins/](plugins) contains the bundled plugins
- [examples/](examples) contains example scripts
- [docs/Plugins.md](docs/Plugins.md) has the deeper plugin notes

## Notes

- This project is still in Beta and as ROBLOX continues with their horrible updates it could coderot but hopefully i manage to maintain it in my freetime :)



## Additional

There is also LX Explorer for the all knowing which is restricted

This is the private tester version of LX. It is for trusted users, contributors, and other special people

This version contains:

- Script editing
- Datastore inspection and management
- Secret viewer
- Better 3D viewer
- 5 built in plugins
- Priority support



Made with 💙 by Aero
