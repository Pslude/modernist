# Modernist

A game project built in Godot with an extremely modular design. The base game provides only a minimal mod-loading framework, with all features and content that make up the game being provided by modules. Modules are themselves created as Godot projects and exported as "Godot resource pack" files (PCK files, with extension .pck) which can be loaded into a game simply by adding the pack file to the game's /mods/ folder. This allows players to customize every aspect of a game by what they put in the mods folder.

## Packaging Mods

To package a mod, you need to export it from the Godot editor. This can be done using the command line.

First, you need to have an export preset configured in your mod's `export_presets.cfg` file. Then, you can use export the mod as a `.pck` file using `godot` from the command line.

For example, to build the `main_menu` mod, change to the mod's project directory and run the following command:

```bash
cd mods/main_menu/project/
godot --headless --export-pack Linux ../build/main_menu.pck ./project.godot
```

This will create the `main_menu.pck` file in the mod's `build` directory.

