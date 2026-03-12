extends StaticBody2D

var here = true
@export var inversed = false
@export var button1 = 1
@export var button2 = 1

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if inversed == true:
		here = false
		visible = false
		sprite_2d.visible = false
		collision_shape_2d.disabled = true
		move_local_y(2000)
	else:
		here = true
		visible = true
		sprite_2d.visible = true
		collision_shape_2d.disabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.button[button1] == 1 and GameManager.button[button2] == 1:
		if inversed == true:
			visible = true
			sprite_2d.visible = true
			collision_shape_2d.disabled = false
			if here == false:
				here = true
				move_local_y(-2000)
			print("hide")
		else:
			visible = false
			sprite_2d.visible = false
			collision_shape_2d.disabled = true
			if here == true:
				here = false
				move_local_y(2000)
	else:
		if inversed == true:
			visible = false
			sprite_2d.visible = false
			collision_shape_2d.disabled = true
			if here == true:
				here = false
				move_local_y(2000)
		else:
			visible = true
			sprite_2d.visible = true
			collision_shape_2d.disabled = false
			if here == false:
				here = true
				move_local_y(-2000)
