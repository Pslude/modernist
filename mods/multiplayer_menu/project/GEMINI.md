# Mutliplayer Menu

This is a Godot 4.5 project which exports a module for Modernist, a game with an extremely modular design.  The base game provides only a minimal mod-loading framework, with all features and content that make up the game being provided by modules. Modules are themselves created as Godot projects and exported as "Godot resource pack" files (PCK files, with extension .pck) are loaded into a game simply by adding the pack file to "mods" directory in the game install directory. This allows players to customize every aspect of a game by what they put in their "mods" folder.

This module provides a multiplayer menu system, which is accessed from the main game menu, and provides features to browse public servers, join a private server, and host a server. 

