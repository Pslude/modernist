extends Node2D

func initialize_mod(mod_name):
	var init_script_path = "res://{mod_name}/init.gd".format({mod_name=mod_name})
	if ResourceLoader.exists(init_script_path):
		var init_script = load(init_script_path)
		if init_script:
			#print("Running mod init script: ", init_script_path)
			var init_node = init_script.new()
			add_child(init_node)
		else:
			print("Mod init script failed to load: ", init_script_path)


func load_modpacks_from_dir(mods_dir):
	var loaded_mods = []
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
			
			var mod_namespace = "res://{mod_name}/".format({
					mod_name = mod_name,
				})
			#if ResourceLoader.directory_exists(mod_namespace):
			if len(ResourceLoader.list_directory(mod_namespace)):
				print(tr(
					"WARNING: Module namespace {mod_namespace} already exists."
				).format({
					mod_namespace = mod_namespace,
				}))
				
			var loaded = ProjectSettings.load_resource_pack(mod_path)
			if loaded:
				loaded_mods.append(mod_name)
			else:
				print(tr(
					"Failed to load module: {file_name}"
				).format({
					file_name = file_name,
				}))
	
	# Initialize mods after they are all loaded, to matching the order when mods are loaded from source (in dev)
	for mod_name in loaded_mods:
		initialize_mod(mod_name)
		

func _ready():
	var game_dir: String
	
	# when running an editor build (dev)
	if OS.has_feature("editor"):
		# the example mods used in the base game are loaded from source when editing the main project
		# by symlinking to each mod's source dir from the main project root dir
		# causing the editor to includes their resources automatically
		# and under the same "namespace" (res://{mod_name}/) as when loaded from mod packs
		
		# initialize the mods in the project root
		for mod_name in DirAccess.get_directories_at(game_dir):
			initialize_mod(mod_name)
		
		# load mod packs from the main project build dir 
		# load_modpacks_from_dir("../build/mods")
		# load_modpacks_from_dir( ProjectSettings.globalize_path("res://").get_base_dir().get_base_dir().path_join("build").path_join("mods") )
		
		
	# when running a non-editor (export template) build
	else: # OS.has_feature("template"):
		# load mod packs from "mods" directory next to the exe
		load_modpacks_from_dir( OS.get_executable_path().get_base_dir().path_join("mods") )
		
