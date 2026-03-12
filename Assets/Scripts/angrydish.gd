extends Area2D
class_name Angrydish

@export var flip_h = false
@export var wait_time = 350
@export var speed = 75
var move_down = false

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D



var mov = 40
var timer = 350

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = wait_time
	sprite_2d.flip_h = flip_h
	audio_stream_player_2d.stream_paused = true
	audio_stream_player_2d.move_local_y(5000)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if move_down == true:
		move_local_y(speed*0.02*delta)
	else:
		if mov > 1:
			mov -= 1
			move_local_y(-0.15)
		elif mov == 1:
			mov = -80
		if mov < -1:
			mov += 1
			move_local_y(0.15)
		elif mov == -1:
			mov = 80
		
		
		if GameManager.camera == 2 or timer < 0:
			if timer == abs(wait_time * 0.8):
				audio_stream_player_2d.move_local_y(-5000)
			if timer > 0:
				if GameManager.pause == false:
					timer -= 1
			else:
				if flip_h == true:
					move_local_x(speed*0.01*delta)
				else:
						move_local_x(speed*-0.01*delta)
			if GameManager.camera == 2:
				audio_stream_player_2d.stream_paused = false


func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController and GameManager.current_player == 0:
		GameManager.die = true
	elif body is Mustard and GameManager.current_player == 1:
		GameManager.die = true


func _on_area_exited(area: Area2D) -> void:
	if area is Chase_camera:
		audio_stream_player_2d.playing = false
	elif area is Stop:
		move_down = false


func _on_area_entered(area: Area2D) -> void:
	if area is Stop:
		move_down = true
		if flip_h == true:
			flip_h = false
		else:
			flip_h = true
		sprite_2d.flip_h = flip_h
