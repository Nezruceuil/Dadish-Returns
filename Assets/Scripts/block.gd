extends RigidBody2D
class_name block

const Push_Force = 11.0
const Min_Push_Force = 10.0

func _physics_process(delta: float) -> void:
	if not is_instance_valid(GameManager):
		return
	if GameManager.key != 0:
		sleeping = false
		freeze = false
	if GameManager.fall == true:
		sleeping = false
		freeze = false
		GameManager.fall = false
