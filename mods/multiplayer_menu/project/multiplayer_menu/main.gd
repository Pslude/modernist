extends Control

const FindPublicGameMenu = preload("res://multiplayer_menu/find_public_game_menu.tscn")
const JoinPrivateGameMenu = preload("res://multiplayer_menu/join_private_game_menu.tscn")
const HostGameMenu = preload("res://multiplayer_menu/host_game_menu.tscn")

var find_public_game_menu
var join_private_game_menu
var host_game_menu

@onready var main_menu = $VBoxContainer

func _ready():
	$VBoxContainer/FindPublicGameButton.pressed.connect(_on_find_public_game_button_pressed)
	$VBoxContainer/JoinPrivateGameButton.pressed.connect(_on_join_private_game_button_pressed)
	$VBoxContainer/HostGameButton.pressed.connect(_on_host_game_button_pressed)
	$VBoxContainer/BackButton.pressed.connect(_on_back_button_pressed)

	find_public_game_menu = FindPublicGameMenu.instantiate()
	find_public_game_menu.back.connect(_on_back_to_main_menu)
	add_child(find_public_game_menu)
	find_public_game_menu.hide()

	join_private_game_menu = JoinPrivateGameMenu.instantiate()
	join_private_game_menu.back.connect(_on_back_to_main_menu)
	add_child(join_private_game_menu)
	join_private_game_menu.hide()

	host_game_menu = HostGameMenu.instantiate()
	host_game_menu.back.connect(_on_back_to_main_menu)
	add_child(host_game_menu)
	host_game_menu.hide()

func _on_find_public_game_button_pressed():
	main_menu.hide()
	find_public_game_menu.show()

func _on_join_private_game_button_pressed():
	main_menu.hide()
	join_private_game_menu.show()

func _on_host_game_button_pressed():
	main_menu.hide()
	host_game_menu.show()

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://main_menu/main.tscn")

func _on_back_to_main_menu():
	find_public_game_menu.hide()
	join_private_game_menu.hide()
	host_game_menu.hide()
	main_menu.show()
