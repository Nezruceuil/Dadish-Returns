extends Area2D

var time = 0
var detect = false


func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.special_jump = true
		GameManager.special_jump_identity = false
		position.y -= 500
		time = 30
		detect = true


func _on_timer_timeout() -> void:
	if not time == 0:
		time -= 1
	if detect == true:
		if time == 0:
			detect = false
			position.y += 500
