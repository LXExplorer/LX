return function(Library)
    return Library.Register("Quick Search", function(api)
        local window
        local function open()
            if not window then
                window = api.apps.window("lx_quick_search", "Quick Search")
                local list = api.apps.scroller(window.body)
                list.Size = UDim2.fromScale(1, 1)
                list.AutomaticCanvasSize = Enum.AutomaticSize.Y
                local layout = Instance.new("UIListLayout")
                layout.Padding = UDim.new(0, 6)
                layout.SortOrder = Enum.SortOrder.LayoutOrder
                layout.Parent = list
                for index, entry in ipairs({
                    { "Parts", "class:Part" },
                    { "Models", "class:Model" },
                    { "Folders", "class:Folder" },
                    { "Sounds", "class:Sound" },
                    { "Tools", "class:Tool" },
                }) do
                    local query = entry[2]
                    local button = api.apps.button(list, entry[1], index)
                    button.Size = UDim2.new(1, 0, 0, 32)
                    button.MouseButton1Click:Connect(function() Library.Search(query) end)
                end
            end
            window.show()
        end
        return Library.AddApp({ name = "Quick Search", icon = "Folder", open = open })
    end)
end
