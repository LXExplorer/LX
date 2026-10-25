return function(Library)
    return Library.Register("Copy Paths", function()
        return Library.AddMenu(function(selected, selection, item, separator)
            separator()
            item("Copy Full Paths", nil, selected ~= nil, function()
                local paths = {}
                for _, instance in ipairs(selection) do
                    local ok, path = pcall(function() return instance:GetFullName() end)
                    if ok then paths[#paths + 1] = path end
                end
                if #paths == 0 and selected then paths[1] = selected:GetFullName() end
                local text = table.concat(paths, "\n")
                if type(setclipboard) == "function" then setclipboard(text) else print(text) end
            end)
        end)
    end)
end
