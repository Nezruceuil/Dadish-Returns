extends Node2D

@export var player_controler : PlayerController
@export var animation_player : AnimationPlayer
@onready var dadish: Sprite2D = $dadish
@onready var possum: Sprite2D = $possum

func _process(_delta: float) -> void:
	if GameManager.has_started == true:
		if GameManager.current_player == 0:
			visible = true
			if GameManager.pause == true:
				animation_player.play("RESET")
			else:
				#flip
				if player_controler.has_jump == false:
					if player_controler.direction == 1:
						dadish.flip_h = false
						possum.flip_h = false
					elif player_controler.direction < 0:
						dadish.flip_h = true
						possum.flip_h = true
				#move animation
				if GameManager.die == true:
					animation_player.play("die")
				else:
					if abs(player_controler.velocity.x) > 0.0 and player_controler.has_jump == false:
						animation_player.play("move")
					elif player_controler.has_jump == false:
						animation_player.play("idle")
					#jump animation
					if player_controler.velocity.y < 0.0 and player_controler.has_jump == false:
						animation_player.play("jump")
					elif player_controler.velocity.y > 0.0 and player_controler.has_jump == false:
						animation_player.play("fall")
					
					if player_controler.has_jump == true: 
						animation_player.speed_scale = 2.5
						animation_player.play("douplejump")
					else:
						animation_player.speed_scale = 1
		else:
			visible = false
