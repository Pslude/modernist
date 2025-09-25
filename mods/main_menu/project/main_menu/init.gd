extends Control

func _ready():
	#print("Changing scene to Main Menu")
	get_tree().call_deferred("change_scene_to_file", "res://main_menu/main.tscn")
