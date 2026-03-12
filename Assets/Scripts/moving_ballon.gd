extends Path2D
class_name  MovingBallon

@export var path_time = 1.0
@export var path_follow_2D : PathFollow2D

# Called when the node enters the scene tree for the first time.
func _ready():
	move_tween()


func move_tween():
	var tween = get_tree().create_tween().set_loops()
	tween.tween_property(path_follow_2D, "progress_ratio", 1.0, path_time)
	tween.tween_property(path_follow_2D, "progress_ratio", 0.0, path_time)


var time = 0
var detect = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.special_jump = true
		GameManager.special_jump_identity = false
		move_local_y(-500)
		time = 30
		detect = true


func _on_timer_timeout() -> void:
	if not time == 0:
		time -= 1
	if detect == true:
		if time == 0:
			detect = false
			move_local_y(500)
