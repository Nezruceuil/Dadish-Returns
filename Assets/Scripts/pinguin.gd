extends Path2D
class_name Puinguin

@onready var sprite_2d: Sprite2D = $Area2D/Sprite2D


@export var path_time = 1.5
@export var path_follow_2D : PathFollow2D
@onready var timer: Timer = $Timer
@onready var puinguin: Puinguin = $"."
var direction = 1
var tween : Tween

func _ready():
	if path_follow_2D == null:
		push_error("Burger: path_follow_2D is not assigned on " + str(name))
		return
	move_tween()

func move_tween():
	if not is_inside_tree():
		return
	tween = get_tree().create_tween().set_loops()
	tween.tween_property(path_follow_2D, "progress_ratio", 1.0, path_time)
	tween.tween_property(path_follow_2D, "progress_ratio", 0.0, path_time)

func _exit_tree() -> void:
	if tween:
		tween.kill()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		if is_instance_valid(GameManager):
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
