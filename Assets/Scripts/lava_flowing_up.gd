extends Area2D

var x = 100
var pause = false
@export var speed = 3

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.die = true
		PlayerData.advancements[3] = 1

func _process(delta: float) -> void:
	if GameManager.has_started == true:
		if x > 1:
			x -= 1
			move_local_x(0.05)
		elif x == 1:
			move_local_x(-5)
			x = 100
		
		if pause == false:
			if x < 20:
				move_local_y(speed * -0.13)
			else:
				move_local_y(speed * -0.1)


func _on_area_entered(area: Area2D) -> void:
	if area is Stop:
		pause = true
