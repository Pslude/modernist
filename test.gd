extends Node2D


func _on_ready() -> void:
	
	print('reeeady!')
	
	
	# This could fail if, for example, mod.pck cannot be found.
	var success = ProjectSettings.load_resource_pack("res://mods/mandeldance.linux.pck")

	if success:
		print('success!')
		
		
		# Now one can use the assets as if they had them in the project from the start.
		var imported_scene = load("res://canvas.tscn")
		
		print(imported_scene)
		
		get_tree().change_scene_to_packed(imported_scene)
		
	else:
		print('fail!')
