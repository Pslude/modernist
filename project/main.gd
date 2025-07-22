
extends Node2D

func _ready():
	var mods_dir = "res://mods"
	var dir = DirAccess.open(mods_dir)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.ends_with(".pck"):
				var mod_path = dir.get_current_dir().path_join(file_name)
				var loaded = ProjectSettings.load_resource_pack(mod_path)
				if loaded:
					print("Loaded mod: ", mod_path)
					var mod_scene_path = "res://hello.tscn"
					var mod_scene = load(mod_scene_path)
					if mod_scene:
						var mod_instance = mod_scene.instantiate()
						add_child(mod_instance)
			file_name = dir.get_next()
