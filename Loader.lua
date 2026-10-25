local base = "https://raw.githubusercontent.com/LXExplorer/LX/main/"
local librarySource = game:HttpGet(base .. "lib/LX.lua")
local libraryChunk, libraryError = loadstring(librarySource, "@lib/LX.lua")
assert(libraryChunk, libraryError)
local Library = libraryChunk()
local api = _G.Delve
if not (type(api) == "table" and api.gui and api.gui.Parent and api.apps) then
    local source = game:HttpGet(base .. "LX.lua")
    local chunk, reason = loadstring(source, "@LX.lua")
    assert(chunk, reason)
    chunk()
end
Library.Get()
_G.LXLibrary = Library
return Library
