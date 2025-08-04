# Modernist

A game project built in Godot with an extremely modular design. The base game provides only a minimal mod-loading framework, with all features and content that make up the game being provided by modules. Modules are themselves created as Godot projects and exported as "Godot resource pack" files (PCK files, with extension .pck) which can be loaded into a game simply by adding the pack file to the game's /mods/ folder. This allows players to customize every aspect of a game by what they put in the mods folder.

## Packaging Mods

To package a mod, you need to export it from the Godot editor. This can be done using the command line.

First, you need to have an export preset configured in your mod's `export_presets.cfg` file. Then, you can use the following command to export the mod as a `.pck` file.

For example, to build the `hello_world` mod, change to the mod's project directory and run the following command:

```bash
cd examples/hello_world/project/
godot --headless --export-pack Linux ../build/hello_world.pck ./project.godot
```

This will create the `hello_world.pck` file in the mod's `build` directory.

