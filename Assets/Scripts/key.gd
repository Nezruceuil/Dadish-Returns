extends Area2D

@export var Key = 1


func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.key = Key
		visible = false
