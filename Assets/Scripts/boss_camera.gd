extends Node2D

@onready var camera_2d: Camera2D = $Camera2D

func _ready() -> void:
	GameManager.Boss = false
	GameManager.camera = 0
	camera_2d.enabled = false

func _process(delta: float) -> void:
	if GameManager.die == true:
		GameManager.camera = 1
		camera_2d.enabled = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.camera = 1
		camera_2d.enabled = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.camera = 0
		camera_2d.enabled = false
