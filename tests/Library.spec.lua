return function(Library, api)
    local runs = 0
    local function setup(value)
        assert(value == api)
        runs += 1
        return "loaded"
    end
    assert(Library.Register("Example", setup) == "loaded")
    assert(Library.Register("Example", setup) == "loaded")
    assert(runs == 1)
    local hook = function() end
    local remove = Library.AddMenu(hook)
    assert(table.find(api.menuHooks, hook) ~= nil)
    remove()
    remove()
    assert(table.find(api.menuHooks, hook) == nil)
    Library.Search("class:Folder")
    assert(api.lastSearch == "class:Folder")
    assert(not pcall(Library.AddApp, { name = "Broken" }))
    local app = { name = "Working", open = function() end }
    assert(Library.AddApp(app) == app)
    assert(not pcall(Library.LoadPlugin, "../private.lua"))
    assert(not pcall(Library.LoadPlugin, "https://example.com/plugin.lua"))
    assert(not pcall(Library.Theme, "Bad", { UnknownColor = {} }))
    assert(not pcall(Library.Theme, "Bad", { Accent = "red" }))
    print("Library tests passed")
end
