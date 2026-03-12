extends Control
class_name Music

@export var music = 0
@onready var menu: AudioStreamPlayer = $Menu
@onready var w_1: AudioStreamPlayer = $W1
@onready var timer: Timer = $Timer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	_on_timer_timeout()


func _on_timer_timeout() -> void:
	timer.stop()
	if music == 0:
		menu.play()
		w_1.stop()
		timer.wait_time = 32.05
	else:
		menu.stop()
		w_1.play()
		timer.wait_time = 21.39
	timer.start()
