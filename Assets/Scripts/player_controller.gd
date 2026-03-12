extends CharacterBody2D
class_name PlayerController

@export var speed = 10.0
@export var jump_power = 10.0

var direction = 0
var speed_multiplier = 12.0
var jump_multiplier = -25.0
var jump2_multiplier = -23.0
var has_jump = false
#const SPEED = 150.0
#const JUMP_VELOCITY = -270.0
#const Douple_JUMP_VELOCITY = -230.0
var do = false
var mov = false
var boss = false

@onready var button: Button = $Control/Button
@onready var button_2: Button = $Control/Button2
@onready var pause: Panel = $Control/Pause
@onready var control: Node2D = $Control
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var player_animator: Node2D = $PlayerAnimator
@onready var time: Label = $timer



var y = 0

@onready var camera_2d: Camera2D = $Camera2D

@onready var grass: Sprite2D = $grass
@onready var dadish: Sprite2D = $PlayerAnimator/dadish
@onready var possum: Sprite2D = $PlayerAnimator/possum

func _ready() -> void:
	GameManager.has_started = false
	grass.visible = true
	boss = false
	pause.visible = false
	button.visible = true
	button_2.visible = false
	collision_shape_2d.disabled = true
	Engine.time_scale = 1
	


func _process(delta: float) -> void:
	if GameManager.has_started == false:
		dadish.visible = false
		grass.visible = true
		if Input.is_action_just_pressed("jump"):
			grass.visible = false
			collision_shape_2d.disabled = false
			
			if PlayerData.character == 0:
				dadish.visible = true
				possum.visible = false
			else:
				dadish.visible = false
				possum.visible = true
			GameManager.has_started = true
			velocity.y = jump_power * jump_multiplier
	else:
		#timer
		if GameManager.pause == false:
			GameManager.total_time += round(delta * 100)
			time.text = str(GameManager.total_time * 0.01)
		
		if GameManager.pause == true:
			position.x = GameManager.pos_x
			position.y = GameManager.pos_y


func _physics_process(delta: float) -> void:
	if GameManager.has_started == true:
		if pause.visible == false and GameManager.pause == false and GameManager.current_player == 0:
			collision_shape_2d.disabled = false
			player_animator.visible = true
			if PlayerData.character == 0:
				dadish.visible = true
				possum.visible = false
			else:
				dadish.visible = false
				possum.visible = true
			if do == true:
				position.y -= 20
				do = false
			if GameManager.die == true:
				if y < 20:
					move_local_y(-1)
					camera_2d.offset.y = y * 0.5
					control.position.y = y * 0.5 - 50
					time.position.y = y * 0.5 - 50
				elif y < 25:
					move_local_y(-0.5)
					camera_2d.offset.y = y * 0.25
					control.position.y = y * 0.25 - 50
					time.position.y = y * 0.25 - 50
				elif y < 30:
					camera_2d.offset.y = y * 0.25
					control.position.y = y * 0.25 - 50
					time.position.y = y * 0.25 - 50
				elif y < 130:
					move_local_y(2)
					camera_2d.offset.y = y * -2 + 22.50
					control.position.y = y * -2 + 22.50 - 50
					time.position.y = y * -2 + 22.50 - 50
				else:
					GameManager.respawn()
				y += 1
			else:
				# Add the gravity.
				if not is_on_floor():
					if GameManager.player_y_added == 1:
						velocity += get_gravity() * delta
					else:
						velocity.y = GameManager.player_y_added * 2000 * delta
				else:
					has_jump = false
					if not GameManager.player_y_added == 1:
						velocity.y = GameManager.player_y_added * 5000 * delta
				if GameManager.special_jump == true:
					if GameManager.special_jump_identity == false:
						velocity.y = jump_power * jump_multiplier 
					else:
						velocity.y = jump_power * jump_multiplier * 1.5 - GameManager.player_y_added
					GameManager.special_jump = false
					has_jump = false
				
				# Handle jump.
				if Input.is_action_just_pressed("jump"):
					if is_on_floor():
						velocity.y = jump_power * jump_multiplier
					elif has_jump == false:
						velocity.y = jump_power * jump2_multiplier
						has_jump = true
				
				
				# Get the input direction and handle the movement/deceleration.
				# As good practice, you should replace UI actions with custom gameplay actions.
				direction = Input.get_axis("move_left","move_right")
				if direction:
					velocity.x = direction * speed * speed_multiplier
				else:
					velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)
				
				move_and_slide()
				
				
				const Push_Force = 12
				const Min_Push_Force = 10
				
				for i in get_slide_collision_count():
					var c = get_slide_collision(i)
					if c.get_collider() is RigidBody2D:
						var push_force= (Push_Force * velocity.length() / speed_multiplier) + Min_Push_Force
						c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
				
				if GameManager.camera == 1:
					if is_on_floor():
						if boss == false:
							DialogueManager.show_dialogue_balloon(load("res://Assets/dialogue/bosses.dialogue"), "start")
							boss = true
					camera_2d.enabled = false
					control.visible = false
				elif GameManager.camera == 0:
					camera_2d.enabled = true
					if GameManager.die == true:
						control.visible = false
						control.visible = true
						camera_2d.enabled = true
						camera_2d.zoom.x = 6.5
						camera_2d.zoom.y = 6.5
					else:
						control.visible = true
						camera_2d.enabled = true
					camera_2d.zoom.x = 6.5
					camera_2d.zoom.y = 6.5
				else:
					camera_2d.zoom.x = 4
					camera_2d.zoom.y = 4
					camera_2d.offset.y = -40
					control.visible = false
					camera_2d.enabled = true
		elif GameManager.current_player == 1:
			do = true
			position.x = GameManager.pos_x
			position.y = GameManager.pos_y
			collision_shape_2d.disabled = true
			dadish.visible = false
			possum.visible = false
			player_animator.visible = false


func _on_button_pressed() -> void:
	if pause.visible == true:
		pause.visible = false
		button.visible = true
		button_2.visible = false
		Engine.time_scale = 1
	else:
		pause.visible = true
		button.visible = false
		button_2.visible = true
		Engine.time_scale = 0


func _on_quit_pressed() -> void:
	if GameManager.has_star == 1:
		PlayerData.star_count -= 1
		GameManager.has_star = 0
	GameManager.die = false
	if PlayerData.level_done > 0:
		if PlayerData.level[PlayerData.level_done - 1] == 1:
			if GameManager.current_area == PlayerData.level_done - 1:
				PlayerData.level_done -= 1
	get_tree().change_scene_to_file("res://Assets/Scenes/Area Functionality/main_menu1.tscn")
