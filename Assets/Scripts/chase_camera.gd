extends Area2D
class_name Chase_camera


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body is PlayerController:
		GameManager.camera = 2



func _on_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body is PlayerController:
		if GameManager.current_player == 0:
			GameManager.camera = 0
	elif body is Mustard:
		if GameManager.current_player == 1:
			GameManager.camera = 0
