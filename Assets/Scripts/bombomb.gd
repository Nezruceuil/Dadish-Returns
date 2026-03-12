extends Path2D
class_name Bombomb


@onready var key_1: Area2D = $Key_1
@onready var area_2d: Area2D = $Area2D
@onready var boss_sprite_2d: Sprite2D = $Area2D/Sprite2D
@onready var boss_collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

@onready var sprite_2d: Sprite2D = $Area2D/Sprite2D
@onready var timer: Timer = $Timer

@export var path_time = 1.5
@export var path_follow_2D : PathFollow2D

@onready var falling: Area2D = $falling
@onready var sprite: Sprite2D = $falling/Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $falling/CollisionShape2D
@onready var animation_player: AnimationPlayer = $falling/AnimationPlayer
@onready var collision_shape_2d2: CollisionShape2D = $Area2D/CollisionShape2D
@onready var animation_boss: AnimationPlayer = $Area2D/AnimationPlayer
@onready var rigid_body_2d: RigidBody2D = $RigidBody2D
@onready var collision_shape_2d_2: CollisionShape2D = $RigidBody2D/CollisionShape2D2
@onready var sprite_2d_2: Sprite2D = $RigidBody2D/Sprite2D2

var mov = false

var PV = 3
var Health = 1

var is_falling = 0
var direction = 1

var rng = RandomNumberGenerator.new()
var costume = 0
var good = false

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.visible = false
	collision_shape_2d.disabled = true
	sprite_2d_2.visible = false
	collision_shape_2d_2.disabled = true
	boss_collision_shape_2d.disabled = false
	boss_sprite_2d.visible = true
	key_1.visible = false
	key_1.position.y = 2000

func _process(delta: float) -> void:
	if GameManager.Boss == true:
		if mov == false:
			move_tween()
			mov = true
		if PV < 1:
			if PV == 0:
				rigid_body_2d.position.x = area_2d.position.x
				rigid_body_2d.position.y = area_2d.position.y
				key_1.visible = true
				PV = -1
			rigid_body_2d.visible = true
			rigid_body_2d.sleeping = false
			rigid_body_2d.freeze = false
			rigid_body_2d.get_gravity()
			collision_shape_2d_2.disabled = false
			sprite_2d_2.visible = true
			falling.visible = false
			collision_shape_2d.disabled = true
			collision_shape_2d2.disabled = true
			boss_sprite_2d.visible = false
			boss_collision_shape_2d.disabled = true
			key_1.position.y = 10
			PlayerData.advancements[2] = 1
		else:
			if is_falling == 0:
				if rng.randi_range(1,25 * PV) == 1:
					fall()
			elif is_falling == 1:
				falling.position.y += 50 * Health * 0.5 * delta
			else:
				falling.position.y -= 50 * Health * 0.5 * delta

func fall():
	animation_boss.play("throw")
	costume = rng.randi_range(1,5)
	if costume == 5:
		good = true
	else:
		good = false
	animation_player.play(str(costume))
	is_falling = 1
	falling.position.x = area_2d.position.x
	falling.position.y = area_2d.position.y
	sprite.visible = true
	collision_shape_2d.disabled = false



func move_tween():
	var tween = get_tree().create_tween().set_loops()
	tween.tween_property(path_follow_2D, "progress_ratio", 1.0, path_time * PV)
	tween.tween_property(path_follow_2D, "progress_ratio", 0.0, path_time * PV)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.die = true


func _on_falling_body_entered(body: Node2D) -> void:
	if not body is PlayerController:
		falling.position.y = 2000
		collision_shape_2d.disabled = true
		is_falling = 0
		sprite.visible = false
	else:
		if is_falling == 1:
			if good == true:
				is_falling = 2
			else:
				GameManager.die = true



func _on_falling_area_entered(area: Area2D) -> void:
	if is_falling == 2:
		if area is Area2D:
			is_falling == 0
			PV -= 1
			Health += 0.5
			animation_boss.play("damage")
			sprite.visible = false
			collision_shape_2d.disabled = true
