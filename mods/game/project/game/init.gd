extends Control

func _ready():
	get_tree().call_deferred("change_scene_to_file", "res://game/main.tscn")
