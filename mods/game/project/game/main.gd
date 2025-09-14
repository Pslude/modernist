extends Control

func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://settings_menu/main.tscn")

func _on_back_to_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://main_menu/main.tscn")
