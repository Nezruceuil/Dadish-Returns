extends Path2D
class_name Burger

@onready var sprite_2d: Sprite2D = $Area2D/Sprite2D
@onready var timer: Timer = $Timer

@export var path_time = 4
@export var path_follow_2D : PathFollow2D

var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	move_tween()


func move_tween():
	var tween = get_tree().create_tween().set_loops()
	tween.tween_property(path_follow_2D, "progress_ratio", 1.0, path_time)
	tween.tween_property(path_follow_2D, "progress_ratio", 0.0, path_time)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.die = true


func _on_timer_timeout() -> void:
	if sprite_2d.flip_h == true:
		sprite_2d.flip_h = false
	else:
		sprite_2d.flip_h = true
