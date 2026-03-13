extends Path2D
class_name MovingPlatform

@export var path_time = 1.0
@export var path_follow_2D : PathFollow2D


func _ready():
	path_time = max(0.01, path_time)
	if path_follow_2D == null:
		push_error("MovingPlatform: path_follow_2D is not assigned on " + str(name))
		return
	move_tween()

var tween : Tween

func move_tween():
	if not is_inside_tree():
		return
	tween = get_tree().create_tween().set_loops()
	tween.tween_property(path_follow_2D, "progress_ratio", 1.0, path_time)
	tween.tween_property(path_follow_2D, "progress_ratio", 0.0, path_time)

func _exit_tree() -> void:
	if tween:
		tween.kill()
