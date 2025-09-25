extends Control

const ControlsSettings = preload("res://settings_menu/settings/controls.tscn")
const VideoSettings = preload("res://settings_menu/settings/video.tscn")
const AudioSettings = preload("res://settings_menu/settings/audio.tscn")
const LanguageSettings = preload("res://settings_menu/settings/language.tscn")

@onready var settings_window = $HSplitContainer/SettingsWindow

var current_settings_scene = null

func _ready():
	$HSplitContainer/VBoxContainer/ControlsButton.pressed.connect(_on_category_button_pressed.bind(ControlsSettings))
	$HSplitContainer/VBoxContainer/VideoButton.pressed.connect(_on_category_button_pressed.bind(VideoSettings))
	$HSplitContainer/VBoxContainer/AudioButton.pressed.connect(_on_category_button_pressed.bind(AudioSettings))
	$HSplitContainer/VBoxContainer/LanguageButton.pressed.connect(_on_category_button_pressed.bind(LanguageSettings))

	_on_category_button_pressed(VideoSettings)

func _on_category_button_pressed(settings_scene):
	if current_settings_scene:
		current_settings_scene.queue_free()

	current_settings_scene = settings_scene.instantiate()
	settings_window.add_child(current_settings_scene)

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://main_menu/main.tscn")
