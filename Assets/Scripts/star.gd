extends Area2D

func _ready() -> void:
	if not PlayerData.level[GameManager.current_area] == 3:
		visible = true
	else:
		visible = false


func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController or Mustard:
		GameManager.star()
		GameManager.has_star = 1
		visible = false
