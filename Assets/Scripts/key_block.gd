extends StaticBody2D


var despawn = false
@export var Key_block = 1
@export var inverted = false
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	if inverted == true:
		visible = false
		despawn = true
		collision_shape_2d.disabled = true
	else:
		visible = true
		despawn = false
		collision_shape_2d.disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inverted == false:
		if despawn == false:
			if GameManager.key == Key_block:
				visible = false
				despawn = true
				collision_shape_2d.disabled = true
	else:
		if despawn == true:
			if GameManager.key == Key_block:
				visible = true
				despawn = false
				collision_shape_2d.disabled = false
