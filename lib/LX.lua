local Library = { Version = "1.0.0", Repository = "https://raw.githubusercontent.com/LXExplorer/LX/main/" }
local registered = {}

function Library.Get(timeout)
    local started = os.clock()
    repeat
        local api = _G.Delve
        if type(api) == "table" and api.gui and api.gui.Parent and api.apps and api.menuHooks and api.search and api.goTo then
            return api
        end
        if os.clock() - started >= (timeout or 30) then
            error("Run LX.lua first, then load your plugin", 2)
        end
        task.wait(0.1)
    until false
end

function Library.Register(name, setup)
    assert(type(name) == "string" and name ~= "", "Plugin needs a name")
    assert(type(setup) == "function", "Plugin needs a setup function")
    local api = Library.Get()
    if registered[name] and registered[name].api == api then
        return registered[name].value
    end
    local value = setup(api, Library)
    registered[name] = { api = api, value = value }
    return value
end

function Library.AddApp(app)
    assert(type(app) == "table" and type(app.name) == "string" and type(app.open) == "function", "App needs a name and open function")
    return Library.Get().apps.add(app)
end

function Library.AddMenu(callback)
    assert(type(callback) == "function", "Menu hook needs a function")
    local hooks = Library.Get().menuHooks
    table.insert(hooks, callback)
    local connected = true
    return function()
        if not connected then return end
        connected = false
        local index = table.find(hooks, callback)
        if index then table.remove(hooks, index) end
    end
end

function Library.Search(text)
    assert(type(text) == "string", "Search needs text")
    Library.Get().search(text)
end

function Library.Select(instance)
    assert(typeof(instance) == "Instance", "Select needs an instance")
    Library.Get().goTo(instance)
end

function Library.Theme(name, overrides)
    assert(type(name) == "string" and name ~= "", "Theme needs a name")
    assert(type(overrides) == "table", "Theme needs a color table")
    local api = Library.Get()
    local theme = {}
    for key, color in pairs(api.Theme) do theme[key] = color end
    for key, color in pairs(overrides) do
        assert(theme[key] ~= nil and typeof(color) == "Color3", "Unknown theme key or invalid color: " .. tostring(key))
        theme[key] = color
    end
    if not api.Themes.list[name] then table.insert(api.Themes.order, name) end
    api.Themes.list[name] = theme
    api.applyTheme(name)
    return theme
end

function Library.LoadPlugin(path)
    assert(type(path) == "string" and path:match("^[%w_/%-]+%.lua$") and not path:find("..", 1, true), "Use a repository Lua file path")
    local source = game:HttpGet(Library.Repository .. path)
    local chunk, reason = loadstring(source, "@" .. path)
    assert(chunk, reason)
    local setup = chunk()
    assert(type(setup) == "function", "Plugin file must return a function")
    return setup(Library)
end

return Library
