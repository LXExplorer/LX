# LX

LX is a Roblox explorer. I wanted stuff Dex didn't have so I made this. You can look through the game, mess with properties, look at scripts and models, and save stuff.

Yeah a lot of it is vibecoded with Claude. I also wrote and edited parts myself like the themes, config, plugins and some of the apps. If that bothers you, use Dex I guess.

This is the public version of LX. Source and LinkedSource are hidden here.

LX All Knowing is a continued version of LX restricted to powerful people. It's private, so it isn't included in this repo.

You get the explorer and properties window like in Studio. Search for things, rename them, copy and paste, delete, group, teleport to them or zoom in on them. Properties you can't edit show up grey instead of pretending you can change them.

There's a script viewer, a 3d viewer and a notepad too. Hook lets you watch remotes so you can see what the game is sending.

You can save the place, dump scripts, or export things like the game tree, remotes, nil instances, bytecode, attributes and tags. What actually works depends on your executor.

It has themes like Roblox Studio, One Dark, Tokyo Night, Solarized and Rose Pine. You can import your own too. There's a low performance mode if your pc struggles with the effects.

To run it just open `LX.lua`, paste it into your executor and run it. The config is at the top if you want to change stuff like the icon or intro.

Or run this after the repo is uploaded to GitHub:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/LXExplorer/LX/main/Loader.lua"))()
```

The link uses the main branch. Change it if your branch has another name.

`lib/LX.lua` is the library for making plugins without digging through the entire script. `plugins` has Quick Search, Copy Paths and Place Info. `examples` has a plugin starting point, a theme example and a script that loads all three plugins. [Plugin notes](docs/Plugins.md) show how to use them.

LX.lua still works on its own. You don't need the library unless you're using plugins.

Please fork this if you want to change something. You don't need to ask me. Make your own version, fix something that annoys you, whatever. I'd like to see what people do with it.

And if you make plugins, put them out publicly so other people can use them too. You can add your own apps without editing the whole script. Don't feel like a plugin has to be some huge thing either. If it's useful to you it might be useful to someone else.

[Join LX's server](https://discord.gg/ygMePuFfYF) if you want to talk about LX, share plugins or show what you've been making.

## Important

LX can only work with what your executor supports. Showing a property and being able to read it are different things. Same goes for scripts and saving places. If your executor doesn't support something, LX can't just make it work.

Only use it where you have permission to. And read other people's plugins before running them. Don't run random code just because someone called it an LX plugin.

## Todo

Nothing here is a promise or a release date. Just stuff I'd like to work on.

☐ Fix bugs people find

☐ Test with more executors

☐ Make it run better on slower pcs

☑ Add a simple plugin example people can start with

☐ Put together a list of public plugins

Big parts were vibecoded, small parts were hand made. Zinnia never added the stuff this has so I did. Terry Davis would be proud.
