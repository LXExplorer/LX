return function(Library)
    return Library.Register("My Plugin", function(api)
        return Library.AddApp({
            name = "My Plugin",
            icon = "Folder",
            open = function()
                api.search("class:Folder")
            end,
        })
    end)
end
