extends CharacterBody2D
class_name Mustard 

const SPEED = 120.0
const JUMP_VELOCITY = -260

var ok = false
var did = false
var y = 0
var shot = false

var bullet = [0,0,0,0,0]
var distance = [0,0,0,0,0]


@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var bullet_1: Area2D = $bullet1
@onready var bullet_2: Area2D = $bullet2
@onready var bullet_3: Area2D = $bullet3
@onready var bullet_4: Area2D = $bullet4
@onready var bullet_5: Area2D = $bullet5



func _physics_process(delta: float) -> void:
		# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if GameManager.current_player == 1 and GameManager.die == false:
		
		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
			animation_player.play("jump")
			shot = true
		
		
		velocity.x = SPEED
		
		
		GameManager.pos_x = position.x
		GameManager.pos_y = position.y
		
		
		move_and_slide()
	elif not GameManager.current_player == 1:
		animation_player.play("RESET")
	else:
		y += 1
		if y < 25:
			move_local_y(-1)
		elif y < 50:
			move_local_y(1.8)
		elif y < 100:
			move_local_y(2)
		else:
			GameManager.respawn()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if ok == false:
		if body is PlayerController:
			ok = true
			if GameManager.current_player == 0:
				animation_player.play("move")
			GameManager.current_player = 1


func _on_die_body_entered(body: Node2D) -> void:
	if GameManager.current_player == 1:
		GameManager.die = true


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if shot == true:
		move_local_x(-2)
		if bullet[0] == 0:
			bullet[0] = 1
		elif  bullet[1] == 0:
			bullet[1] = 1
		elif  bullet[2] == 0:
			bullet[2] = 1
		elif  bullet[3] == 0:
			bullet[3] = 1
		elif  bullet[4] == 0:
			bullet[4] = 1
		shot = false

func _process(delta: float) -> void:
	if bullet[0] == 1:
		bullet_1.visible = true
		bullet_1.move_local_x(0.8)
		distance[0] += 0.8
	else:
		bullet_1.visible = false
		bullet_1.move_local_x(distance[0] * -1)
		distance[0] = 0
	if bullet[1] == 1:
		bullet_2.visible = true
		bullet_2.move_local_x(0.8)
		distance[1] += 0.8
	else:
		bullet_2.visible = false
		bullet_2.move_local_x(distance[1] * -1)
		distance[1] = 0
	if bullet[2] == 1:
		bullet_3.visible = true
		bullet_3.move_local_x(0.8)
		distance[2] += 0.8
	else:
		bullet_3.visible = false
		bullet_3.move_local_x(distance[2] * -1)
		distance[2] = 0
	if bullet[3] == 1:
		bullet_4.visible = true
		bullet_4.move_local_x(0.8)
		distance[3] += 0.8
	else:
		bullet_4.visible = false
		bullet_4.move_local_x(distance[3] * -1)
		distance[3] = 0
	if bullet[4] == 1:
		bullet_5.visible = true
		bullet_5.move_local_x(0.8)
		distance[4] += 0.8
	else:
		bullet_5.visible = false
		bullet_5.move_local_x(distance[4] * -1)
		distance[4] = 0
	


func _on_dialogue_body_entered(body: Node2D) -> void:
	if did == false:
		if body is PlayerController:
			GameManager.pause = true
			GameManager.pos_x = position.x - 70
			GameManager.pos_y = position.y + 1
			did = true
			Dialogue.special = 1
			DialogueManager.show_dialogue_balloon(load("res://Assets/dialogue/special.dialogue"), "start")


func _on_bullet_1_body_entered(body: Node2D) -> void:
	if not body is Mustard:
		bullet[0] = 0


func _on_bullet_2_body_entered(body: Node2D) -> void:
	if not body is Mustard:
		bullet[1] = 0


func _on_bullet_3_body_entered(body: Node2D) -> void:
	if not body is Mustard:
		bullet[2] = 0


func _on_bullet_4_body_entered(body: Node2D) -> void:
	if not body is Mustard:
		bullet[3] = 0


func _on_bullet_5_body_entered(body: Node2D) -> void:
	if not body is Mustard:
		bullet[4] = 0


func _on_bullet_1_area_entered(area: Area2D) -> void:
	if not area is Mustard_bullet:
		bullet[0] = 0


func _on_bullet_2_area_entered(area: Area2D) -> void:
	if not area is Mustard_bullet:
		bullet[1] = 0


func _on_bullet_3_area_entered(area: Area2D) -> void:
	if not area is Mustard_bullet:
		bullet[2] = 0


func _on_bullet_4_area_entered(area: Area2D) -> void:
	if not area is Mustard_bullet:
		bullet[3] = 0


func _on_bullet_5_area_entered(area: Area2D) -> void:
	if not area is Mustard_bullet:
		bullet[4] = 0
