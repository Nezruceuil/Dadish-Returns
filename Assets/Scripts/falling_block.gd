extends StaticBody2D
class_name falling_block

var time = 0
var falling = false
@export var respawn = true

@onready var collision_shape_2d1: CollisionShape2D = $Area2D/CollisionShape2D
@onready var collision_shape_2d2: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	visible = true
	collision_shape_2d1.disabled = false
	collision_shape_2d2.disabled = false
	falling == false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if falling == true:
		if time == 0:
			move_local_y(2000)
			time = -250
		elif time > 0:
			time -= 1
			move_local_y(0.5)
		else:
			if time == -1:
				move_local_y(-2025)
				falling = false
				time = 0
			else:
				time += 1


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is block:
		GameManager.fall = true
	if body is PlayerController or block and not body is TileMap and not body is falling_block:
		if respawn == false:
			visible = false
			collision_shape_2d1.disabled = true
			collision_shape_2d2.disabled = true
			move_local_y(10000)
		else:
			time = 50
			falling = true


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Angrydish:
		visible = false
		collision_shape_2d1.disabled = true
		collision_shape_2d2.disabled = true
		move_local_y(10000)
