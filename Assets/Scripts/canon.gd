extends Node2D


@onready var timer: Timer = $Timer
@onready var shot_1: Area2D = $shot1
@onready var shot_2: Area2D = $shot2
@onready var shot_3: Area2D = $shot3
@onready var shot_4: Area2D = $shot4
@onready var shot_5: Area2D = $shot5
@onready var shot_6: Area2D = $shot6
@onready var shot_7: Area2D = $shot7
@onready var shot_8: Area2D = $shot8
@onready var shot_9: Area2D = $shot9
@onready var shot_10: Area2D = $shot10

@onready var sprite_2d: Sprite2D = $StaticBody2D/Sprite2D
@onready var sprite_2d1: Sprite2D = $shot1/Sprite2D
@onready var sprite_2d2: Sprite2D = $shot2/Sprite2D
@onready var sprite_2d3: Sprite2D = $shot3/Sprite2D
@onready var sprite_2d4: Sprite2D = $shot4/Sprite2D
@onready var sprite_2d5: Sprite2D = $shot5/Sprite2D
@onready var sprite_2d6: Sprite2D = $shot6/Sprite2D
@onready var sprite_2d7: Sprite2D = $shot7/Sprite2D
@onready var sprite_2d8: Sprite2D = $shot8/Sprite2D
@onready var sprite_2d9: Sprite2D = $shot9/Sprite2D
@onready var sprite_2d10: Sprite2D = $shot10/Sprite2D
@onready var animation_player: AnimationPlayer = $StaticBody2D/AnimationPlayer

@export var shot_delay_in_sec = 2.5
@export var right = false
@export var color = "ff0000"

var shot_done = 0
var shot = [0,0,0,0,0,0,0,0,0,0]
var direction = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.stop()
	timer.wait_time = shot_delay_in_sec
	timer.start()
	shot_1.position.x = 0
	if right == false:
		direction = 1
	else:
		direction = -1
	shot_1.modulate = color
	shot_2.modulate = color
	shot_3.modulate = color
	shot_4.modulate = color
	shot_5.modulate = color
	shot_6.modulate = color
	shot_7.modulate = color
	shot_8.modulate = color
	shot_9.modulate = color
	shot_10.modulate = color
	sprite_2d.flip_v = right
	sprite_2d1.flip_v = right
	sprite_2d2.flip_v = right
	sprite_2d3.flip_v = right
	sprite_2d4.flip_v = right
	sprite_2d5.flip_v = right
	sprite_2d6.flip_v = right
	sprite_2d7.flip_v = right
	sprite_2d8.flip_v = right
	sprite_2d9.flip_v = right
	sprite_2d10.flip_v = right


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if shot[0] == 1:
		shot_1.position.x += 1 * direction
	else:
		shot_1.position.x = 0
	if shot[1] == 1:
		shot_2.position.x += 1 * direction
	else:
		shot_2.position.x = 0
	if shot[2] == 1:
		shot_3.position.x += 1 * direction
	else:
		shot_3.position.x = 0
	if shot[3] == 1:
		shot_4.position.x += 1 * direction
	else:
		shot_4.position.x = 0
	if shot[4] == 1:
		shot_5.position.x += 1 * direction
	else:
		shot_5.position.x = 0
	if shot[5] == 1:
		shot_6.position.x += 1 * direction
	else:
		shot_6.position.x = 0
	if shot[6] == 1:
		shot_7.position.x += 1 * direction
	else:
		shot_7.position.x = 0
	if shot[7] == 1:
		shot_8.position.x += 1 * direction
	else:
		shot_8.position.x = 0
	if shot[8] == 1:
		shot_9.position.x += 1 * direction
	else:
		shot_9.position.x = 0
	if shot[9] == 1:
		shot_10.position.x += 1 * direction
	else:
		shot_10.position.x = 0


func _on_timer_timeout() -> void:
	if shot_done >= 9:
		shot_done = 0
	else:
		animation_player.play("shot")
		shot_done += 1
	shot[shot_done] = 1


func _on_shot_1_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.die = true
	else:
		shot[0] = 0


func _on_shot_2_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.die = true
	else:
		shot[1] = 0


func _on_shot_3_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.die = true
	else:
		shot[2] = 0


func _on_shot_4_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.die = true
	else:
		shot[3] = 0


func _on_shot_5_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.die = true
	else:
		shot[4] = 0


func _on_shot_6_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.die = true
	else:
		shot[5] = 0


func _on_shot_7_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.die = true
	else:
		shot[6] = 0


func _on_shot_8_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.die = true
	else:
		shot[7] = 0


func _on_shot_9_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.die = true
	else:
		shot[8] = 0


func _on_shot_10_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.die = true
	else:
		shot[9] = 0
