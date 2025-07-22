# Modernist

A game project built in Godot with an extremely modular design.  The base game provides only a minimal mod-loading framework, with all features and content that make up the game being provided by modules. Modules are themselves created as Godot projects and exported as "Godot resource pack" files (PCK files, with extension .pck) which can be loaded into a game simply by adding the pack file to the game's /mods/ folder. This allows players to customize every aspect of a game by what they put in the mods folder.

