extends Area2D

var rng = RandomNumberGenerator.new()
var mov = 0
var fall = 0


@export var color = "8f0000"
@export var range = 1
@export var fall_distance = 10

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	sprite_2d.modulate = color

func _process(delta: float) -> void:
	if fall == 0:
		move_local_x(mov * -1)
		mov = rng.randi_range(range*-10,range*10)
		move_local_y(fall_distance*-10)
		move_local_x(mov)
		animation_player.play("RESET")
		fall = 1
	elif fall == 1:
		move_local_y(1)
	else:
		animation_player.play("vanish")
	if sprite_2d.visible == false:
		fall = 0


func _on_body_entered(body: Node2D) -> void:
	move_local_y(0.2)
	if body is PlayerController:
		GameManager.die = true
	else:
		fall = 2
