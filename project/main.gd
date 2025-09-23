extends Node2D

var loaded_packs = []

func _ready():
	var game_dir: String
	# if running export (release)
	if OS.has_feature("template"):
		# load mods from game (exe) dir
		game_dir = OS.get_executable_path().get_base_dir()
	# otherwise, assume running in editor (dev)
	else:
		
		# load mods from source (symlinked in main project dir)
		for dir_name in DirAccess.get_directories_at(game_dir):
			var init_script_path = "res://{mod_name}/init.gd".format({mod_name=dir_name})
			var init_script = load(init_script_path)
			if init_script:
				print("Init: ", init_script_path)
				var init_node = init_script.new()
				add_child(init_node)
		return 
		
		# load packaged mods from parent "build" dir
		#game_dir = "../build/"
		
		
	var mods_dir = game_dir.path_join("mods")
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
				loaded_packs.append(mod_path)
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

func _exit_tree():
	print('main::_exit_tree()')
	for child in get_children():
		child.queue_free()
	call_deferred("unload_packs")
	self.queue_free()

func unload_packs():
	for pack in loaded_packs:
		print('Unload: ', pack)
		if OS.has_feature("template"):
			ProjectSettings.call("unload_resource_pack", pack)
