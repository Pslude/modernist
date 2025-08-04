# Hello World - Example Mod for Modernist

Modernist is a game project built in Godot with an extremely modular design.  The base game provides only a minimal mod-loading framework, with all features and content that make up the game being provided by modules. Modules are themselves created as Godot projects and exported as "Godot resource pack" files (PCK files, with extension .pck) which can be loaded into a game simply by adding the pack file to "mods" directory in the game install directory. This allows players to customize every aspect of a game by what they put in their "mods" folder.

Hello World is the original mod, created as the prototype to aid development of the mod-loading framework and is included with the main project code for testing purposes. It also ask as a reference using best practives, and used as a template for creating mods. It provides minimal functionality, simply printing "Hello World!" to the console.

## Project Layout

The main game project code is a Godot project in the "project" directory. Builds are exported under "build".
