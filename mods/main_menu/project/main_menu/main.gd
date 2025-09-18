extends Control

func _on_new_game_button_pressed():
	get_tree().change_scene_to_file("res://game/main.tscn")

func _on_multiplayer_button_pressed():
	get_tree().change_scene_to_file("res://multiplayer_menu/main.tscn")

func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://settings_menu/main.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
