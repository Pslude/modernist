
extends Node2D

func _ready():
	# load from "mods" in folder game exe dir if built (template) or in "../build/" if dev (editor)
	var game_dir = OS.get_executable_path().get_base_dir() if OS.has_feature("template") else "../build/"
	var mods_dir = game_dir.path_join("mods/")
	print(tr(
		"Loading modules from: {path}"
	).format({
		path = mods_dir,
	}))
	for file_name in DirAccess.get_files_at(mods_dir):
		if file_name.ends_with(".pck"):
			print(tr(
				"Loading: {file_name}"
			).format({
				file_name = file_name,
			}))
			var mod_name = file_name.substr(0, file_name.length()-4)
			var mod_path = mods_dir.path_join(file_name)
			var loaded = ProjectSettings.load_resource_pack(mod_path)
			if loaded:
				var init_script_path = "res://{mod_name}/init.gd".format({mod_name=mod_name})
				var init_script = load(init_script_path)
				if init_script:
					print("Init: ", init_script_path)
					var init_node = init_script.new()
					add_child(init_node)
			else:
				print(tr(
					"Failed to load module: {file_name}"
				).format({
					file_name = file_name,
				}))
