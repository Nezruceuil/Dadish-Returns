extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var sprite_2d_2: Sprite2D = $Sprite2D2
@onready var label: Label = $Label2

var mov = 40
var jump = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale = 2
	sprite_2d.visible = false
	sprite_2d_2.visible = true
	label.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if jump == false:
		if Input.is_action_just_pressed("controller") or Input.is_action_just_pressed("mouse"):
			if Input.is_action_just_pressed("controller"):
				GameManager.mouse = false
			else:
				GameManager.mouse = true
			jump = true
			sprite_2d_2.visible = false
			sprite_2d.visible = true
			mov = -75
		if mov > 0:
			sprite_2d_2.move_local_y(0.05)
			mov -= 1
		elif mov < -1:
			sprite_2d_2.move_local_y(-0.05)
			mov += 1
		elif mov == 0:
			mov = -41
		else:
			mov = 40
	else:
		if mov > 160:
			Engine.time_scale = 1
			get_tree().change_scene_to_file("res://Assets/Scenes/Area Functionality/main_menu.tscn")
		if mov < 0:
			sprite_2d.move_local_y(-1.2)
		else:
			label.visible = true
			sprite_2d.move_local_y(2.4)
		mov += 1
