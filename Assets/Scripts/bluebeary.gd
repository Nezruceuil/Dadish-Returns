extends Node2D

@onready var boss: Node2D = $boss
@onready var sprite_2d: Sprite2D = $boss/Area2D/Sprite2D
@onready var collision_shape_2d_2: CollisionShape2D = $boss/Area2D/CollisionShape2D2
@onready var fish: Area2D = $fish
@onready var key_1: Area2D = $Key_1

var right = true
var PV = 10
var direction = 1
var rng = RandomNumberGenerator.new()
var jump = 0
var has_fish = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	key_1.position.y += 2000
	fish.position.x += 120


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.Boss == true:
		if has_fish == false:
			fish.position.y -= 70
			has_fish = true
		if PV <= 0:
			if PV == 0:
				key_1.position.y -= 2000
				fish.position.y += 2000
				PV = -1
			sprite_2d.self_modulate = Color(3.081, 3.081, 3.081)
			boss.position.y += 1
		else:
			if jump == 0:
				boss.move_local_x(1.2*direction)
				if rng.randi_range(1,50 * (PV * 0.5)) == 1:
					jump = -31
					sprite_2d.self_modulate = "ffffff"
			elif jump < -1:
				boss.move_local_y(-1.5)
				jump += 1
			elif jump == -1:
				jump = 30
			else:
				jump -= 1
				boss.move_local_y(1.5)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.die = true
	elif body is not Invis:
		direction *= -1
		if direction == 1:
			sprite_2d.flip_h = false
			sprite_2d.offset.x = 0
			collision_shape_2d_2.move_local_x(28)
		else:
			sprite_2d.flip_h = true
			sprite_2d.offset.x = -8
			collision_shape_2d_2.move_local_x(-28)


func _on_fish_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		PV -= 1
		sprite_2d.self_modulate = Color(3.081, 3.081, 3.081)
		if right == true:
			fish.position.x -= 240
			right = false
		else:
			fish.position.x += 240
			right = true
