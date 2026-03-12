extends CheckBox

var done = false

func _ready() -> void:
	done = false
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		button_pressed = true
	else:
		button_pressed = false

func _process(delta: float) -> void:
	if button_pressed == true and not DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		_ready()
	if button_pressed == false and DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		_ready()

func _on_toggled(toggled_on: bool) -> void:
	if done == true:
		if toggled_on == true:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		done = true
