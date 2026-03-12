extends Path2D
class_name Puinguin

@onready var sprite_2d: Sprite2D = $Area2D/Sprite2D


@export var path_time = 1.5
@export var path_follow_2D : PathFollow2D
@onready var timer: Timer = $Timer
@onready var puinguin: Puinguin = $"."

var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	move_tween()
	timer.wait_time = path_time

func move_tween():
	var tween = get_tree().create_tween().set_loops()
	tween.tween_property(path_follow_2D, "progress_ratio", 1.0, path_time)
	tween.tween_property(path_follow_2D, "progress_ratio", 0.0, path_time)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlayerController or body is Mustard:
		GameManager.die = true


func _on_timer_timeout() -> void:
	if sprite_2d.flip_h == true:
		sprite_2d.flip_h = false
	else:
		sprite_2d.flip_h = true


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Mustard_bullet:
		visible = false
		move_local_y(5000)
