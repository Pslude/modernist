extends Control

@onready var window_mode_button = $GridContainer/WindowModeOptionButton
@onready var resolution_button = $GridContainer/ResolutionOptionButton
@onready var vsync_mode_button = $GridContainer/VSyncModeOptionButton
@onready var frame_rate_limit_button = $GridContainer/FrameRateLimitOptionButton

const RESOLUTIONS = [
	Vector2i(1280, 720),
	Vector2i(1920, 1080),
	Vector2i(2560, 1440),
	Vector2i(3840, 2160)
]

func _ready():
	# Window Mode
	window_mode_button.add_item("Windowed", DisplayServer.WINDOW_MODE_WINDOWED)
	window_mode_button.add_item("Fullscreen", DisplayServer.WINDOW_MODE_FULLSCREEN)
	window_mode_button.add_item("Exclusive Fullscreen", DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	window_mode_button.select(DisplayServer.window_get_mode())
	window_mode_button.item_selected.connect(_on_window_mode_selected)

	# Resolution
	for i in range(RESOLUTIONS.size()):
		resolution_button.add_item(str(RESOLUTIONS[i]), i)
		if DisplayServer.window_get_size() == RESOLUTIONS[i]:
			resolution_button.select(i)
	resolution_button.item_selected.connect(_on_resolution_selected)

	# V-Sync Mode
	vsync_mode_button.add_item("Disabled", DisplayServer.VSYNC_DISABLED)
	vsync_mode_button.add_item("Enabled", DisplayServer.VSYNC_ENABLED)
	vsync_mode_button.add_item("Adaptive", DisplayServer.VSYNC_ADAPTIVE)
	vsync_mode_button.add_item("Mailbox", DisplayServer.VSYNC_MAILBOX)
	vsync_mode_button.select(DisplayServer.window_get_vsync_mode())
	vsync_mode_button.item_selected.connect(_on_vsync_mode_selected)

	# Frame Rate Limit
	frame_rate_limit_button.add_item("Unlimited", 0)
	frame_rate_limit_button.add_item("30", 30)
	frame_rate_limit_button.add_item("60", 60)
	frame_rate_limit_button.add_item("120", 120)
	frame_rate_limit_button.add_item("144", 144)
	var current_fps = Engine.get_max_fps()
	for i in range(frame_rate_limit_button.get_item_count()):
		if frame_rate_limit_button.get_item_id(i) == current_fps:
			frame_rate_limit_button.select(i)
			break
	frame_rate_limit_button.item_selected.connect(_on_frame_rate_limit_selected)

func _on_window_mode_selected(index):
	DisplayServer.window_set_mode(window_mode_button.get_item_id(index))

func _on_resolution_selected(index):
	DisplayServer.window_set_size(RESOLUTIONS[index])

func _on_vsync_mode_selected(index):
	DisplayServer.window_set_vsync_mode(vsync_mode_button.get_item_id(index))

func _on_frame_rate_limit_selected(index):
	Engine.set_max_fps(frame_rate_limit_button.get_item_id(index))
