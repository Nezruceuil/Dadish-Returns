extends Area2D

@export var Key_Needed = 0
@export var SPEED = 20
@export var need_key = true

var has_key = false
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	animation_player.speed_scale = SPEED / 20
	collision_shape_2d.scale.y = SPEED * 2
	collision_shape_2d.position.y = SPEED - 5 * -1

func _process(delta: float) -> void:
	if not has_key == need_key:
		animation_player.stop()
	else:
		animation_player.play("fan")
	if GameManager.key == Key_Needed:
			has_key = true



func _on_body_entered(body: Node2D) -> void:
	if has_key == need_key:
		if body is PlayerController:
			GameManager.player_y_added = SPEED * -0.1 + 1
			PlayerData.advancements[4] = 1



func _on_body_exited(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.player_y_added = 1
