
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
					var init_scene = load("res://init.tscn")
					if init_scene:
						print("Launching mod init.tscn: ", mod_path)
						add_child(init_scene.instantiate())
			file_name = dir.get_next()
