LX

<p align="center">
<img src="https://github.com/LXExplorer/LX/blob/main/preview.png?raw=true" alt="LX Preview" width="100%">
</p>

<p align="center">
<strong>A feature-rich Roblox explorer built to go beyond Dex.</strong>
</p>

Dex was the starting point, but I wanted more than what it offered. Between code that was becoming increasingly difficult to maintain, features that weren't being released publicly, and forks that failed to meaningfully improve the experience, there wasn't much reason to keep waiting for someone else to do it.

So I built LX.

LX is a Roblox explorer designed to give you more control, more tools, and more room to customize. It's built for people who want to inspect games, work with instances, examine available scripts, export data, and extend the explorer with their own plugins.

This isn't another Dex fork with a different name and a few changes. It's my own take on what a modern, extensible explorer should be.

Features
Explorer
Browse the game's instance hierarchy.
Search for instances and navigate large trees.
Rename, copy, paste, delete, and group instances.
Teleport to instances or zoom in on them.
Inspect instance properties and modify supported values.
Display read-only properties as disabled instead of misleading users into thinking they can edit them.
Built-in Tools
Script Viewer — Inspect accessible scripts and their contents.
3D Viewer — View models and other 3D objects.
Notepad — Keep notes while exploring.
Hook — Monitor remote activity and inspect supported remote communications.
Exporting & Dumping

Depending on executor capabilities, LX supports:

Saving the current place.
Dumping scripts.
Exporting the game tree.
Dumping remotes and nil instances.
Exporting bytecode.
Inspecting and exporting attributes and tags.

Not every feature works in every environment. Compatibility depends on the executor and its available functions.

Themes

LX includes multiple themes and support for custom theme imports.

Roblox Studio
One Dark
Tokyo Night
Solarized
Rose Pine
Custom themes
Low-performance mode for systems that struggle with visual effects

Configuration options are located near the top of LX.lua, including settings for the icon and intro.

Why LX?

I made LX because I wanted functionality that the versions of Dex available+-
