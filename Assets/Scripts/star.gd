extends Area2D

func _ready() -> void:
	if not is_instance_valid(GameManager) or not is_instance_valid(PlayerData):
		push_error("AutoLoad not ready")
		return
	if GameManager.current_area < PlayerData.level.size() and not PlayerData.level[GameManager.current_area] == 3:
		visible = true
	else:
		visible = false


func _on_body_entered(body: Node2D) -> void:
	if not is_instance_valid(GameManager) or not is_instance_valid(PlayerData):
		push_error("AutoLoad not ready")
		return
	if body is PlayerController or body is Mustard:
		GameManager.star()
		GameManager.has_star = 1
		visible = false
