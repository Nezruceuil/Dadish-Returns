extends Area2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D

var scene_changing = false

@export var inverted_direction = false

const MAIN_DIALOGUE = preload("res://Assets/dialogue/main.dialogue")

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		if inverted_direction == true:
			GameManager.pos_x = position.x + 30
			GameManager.pos_y = position.y
		else:
			GameManager.pos_x = position.x - 30
			GameManager.pos_y = position.y
		GameManager.pause = true
		DialogueManager.show_dialogue_balloon(MAIN_DIALOGUE, "start")

func _process(delta: float) -> void:
	if Dialogue.kid == true and scene_changing == false:
		scene_changing = true
		get_tree().change_scene_to_file("res://Assets/Scenes/Area Functionality/level_done.tscn")

func _ready() -> void:
	var rect = sprite.region_rect
	rect.position.x = (GameManager.current_area - 1) * 21
	sprite.region_rect = rect
	if inverted_direction == true:
		sprite.flip_h = true
		sprite.offset.x = -6
	else:
		sprite.flip_h = false
		sprite.offset.x = 0
