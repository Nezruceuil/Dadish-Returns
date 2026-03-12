extends Area2D
class_name Stop

func _on_body_entered(body: Node2D) -> void:
	if body is Mustard:
		GameManager.current_player = 0
