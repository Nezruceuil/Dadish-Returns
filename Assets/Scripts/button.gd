extends Area2D

@export var Button_Value = 1
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	if not body is TileMap:
		GameManager.button[Button_Value] = 1
		animation_player.play("press")


func _on_body_exited(body: Node2D) -> void:
	if not body is TileMap:
		GameManager.button[Button_Value] = 0
		animation_player.play("RESET")
