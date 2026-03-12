extends Node2D

var jump = 0
var rng = RandomNumberGenerator.new()

var PV = 3
var boing = 0

@onready var boss: Area2D = $Area2D
@onready var sprite_2d: Sprite2D = $throw/Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $throw/CollisionShape2D
@onready var thrown: Area2D = $throw
@onready var animation_player: AnimationPlayer = $Area2D/AnimationPlayer

@onready var collision_shape_2d_2: CollisionShape2D = $jump/CollisionShape2D
@onready var collision_shape_2d_3: CollisionShape2D = $StaticBody2D/CollisionShape2D3
@onready var collision_shape_2d_4: CollisionShape2D = $StaticBody2D/CollisionShape2D4
@onready var sprite_2d_2: Sprite2D = $StaticBody2D/Sprite2D2
@onready var key_1: Area2D = $Key_1


func _ready() -> void:
	sprite_2d.visible = false
	collision_shape_2d.disabled = true
	boss.visible = true
	sprite_2d_2.visible = false
	collision_shape_2d_2.disabled = true
	collision_shape_2d_3.disabled = true
	collision_shape_2d_4.disabled = true
	key_1.visible = false


func _process(delta: float) -> void:
	if GameManager.Boss == true:
		if PV < 1:
			sprite_2d.visible = false
			collision_shape_2d.disabled = true
			boss.visible = true
			sprite_2d_2.visible = true
			collision_shape_2d_2.disabled = false
			collision_shape_2d_3.disabled = false
			collision_shape_2d_4.disabled = false
			PlayerData.advancements[5] = 1
			if PV == 0:
				key_1.visible = true
				PV = -1
		else:
			if jump == 0:
				if rng.randi_range(1,60) == 1:
					jump = 40
			elif jump > 1:
				jump -= 1
				boss.move_local_y(-2)
				animation_player.play("RESET")
			elif jump < -1:
				jump += 1
				boss.move_local_y(4)
				animation_player.play("fall")
			elif jump == 1:
				jump = -20
			else:
				throw()
				jump = 0
				boss.move_local_y(2)
			
			
			
			
			if not boing == 0:
				if boing == 1 or boing == 4:
					thrown.move_local_x(1.2)
				elif boing == 2 or boing == 3 :
					thrown.move_local_x(-1.2)
				else:
					boing = 0
					sprite_2d.visible = false
					collision_shape_2d.disabled = true


func throw():
	thrown.position.x = 0
	thrown.position.y = 10
	sprite_2d.visible = true
	collision_shape_2d.disabled = false
	boing = rng.randi_range(1,2)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if PV > 0:
		if body is PlayerController:
			GameManager.die = true


func _on_throw_area_entered(area: Area2D) -> void:
	if PV > 0:
		if boing == 3 or boing == 4:
			if area is Area2D:
				animation_player.play("die")
				PV -= 1
				boing = 0
				sprite_2d.visible = false
				collision_shape_2d.disabled = true
				jump = 0
				boss.position.x = 0
				boss.position.y = 0
				print(PV)


func _on_throw_body_entered(body: Node2D) -> void:
	if PV > 0:
		if body is PlayerController:
			GameManager.die = true
		else:
			boing += 2


func _on_jump_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.special_jump = true
		GameManager.special_jump_identity = false
