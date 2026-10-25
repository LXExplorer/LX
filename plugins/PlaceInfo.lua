return function(Library)
    return Library.Register("Place Info", function(api)
        local window
        local label
        local refresh
        local function open()
            if not window then
                window = api.apps.window("lx_place_info", "Place Info")
                label = api.new("TextLabel", {
                    BackgroundTransparency = 1,
                    Position = UDim2.fromOffset(10, 10),
                    Size = UDim2.new(1, -20, 1, -60),
                    Font = api.FONT,
                    TextSize = 16,
                    TextColor3 = api.Theme.Text,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    TextWrapped = true,
                    ZIndex = 3,
                }, window.body)
                refresh = api.apps.button(window.body, "Refresh", 1)
                refresh.Position = UDim2.new(0, 10, 1, -40)
                refresh.Size = UDim2.new(1, -20, 0, 30)
                local function update()
                    label.Text = table.concat({
                        "Place: " .. tostring(game.PlaceId),
                        "Universe: " .. tostring(game.GameId),
                        "Players: " .. tostring(#game:GetService("Players"):GetPlayers()),
                        "Workspace objects: " .. tostring(#workspace:GetDescendants()),
                    }, "\n\n")
                end
                refresh.MouseButton1Click:Connect(update)
                window.refresh = update
            end
            window.refresh()
            window.show()
        end
        return Library.AddApp({ name = "Place Info", icon = "Workspace", open = open })
    end)
end
