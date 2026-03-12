extends Node2D

var mov1 = 0
var mov2 = 15
var x = 60
var y = 60
var direction = -1

var press = false

var star = 0

@onready var node_2d: Node2D = $Node2D
@onready var sprite_2d: Sprite2D = $Node2D/Sprite2D
@onready var sprite_2d_2: Sprite2D = $Node2D/Sprite2D2

@onready var star_1: Label = $stars/Star_1
@onready var star_2: Label = $stars/Star_2
@onready var star_3: Label = $stars/Star_3
@onready var star_4: Label = $stars/Star_4
@onready var star_5: Label = $stars/Star_5
@onready var star_6: Label = $stars/Star_6
@onready var star_7: Label = $stars/Star_7
@onready var star_8: Label = $stars/Star_8
@onready var star_9: Label = $stars/Star_9
@onready var star_10: Label = $stars/Star_10
@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale = 2
	sprite_2d_2.region_rect.position.x = (GameManager.current_area - 1) * 21
	sprite_2d.position.x = 60
	sprite_2d_2.position.x = 60 - 15
	star_1.visible = false
	star_2.visible = false
	star_3.visible = false
	star_4.visible = false
	star_5.visible = false
	star_6.visible = false
	star_7.visible = false
	star_8.visible = false
	star_9.visible = false
	star_10.visible = false
	label.modulate = "646464"



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		if press == true:
			Engine.time_scale = 1
			GameManager.next_level()
		else:
			press = true
			label.modulate = "ffffff"
	
	if mov1 > 0:
		sprite_2d.move_local_x(40*delta)
		direction = -1
		x += 40*delta
		mov1 -= 1
	elif mov1 < -1:
		sprite_2d.move_local_x(-40*delta)
		direction = 1
		x -= 40*delta
		mov1 += 1
	elif mov1 == 0:
		mov1 = -161
	else:
		mov1 = 160
	
	if mov2 > 0:
		sprite_2d_2.move_local_x(40*delta)
		mov2 -= 1
	elif mov2 < -1:
		sprite_2d_2.move_local_x(-40*delta)
		mov2 += 1
	elif mov2 == 0:
		mov2 = -161
	else:
		mov2 = 160
	
	node_2d.move_local_y(-30*delta)
	y -= 30*delta
	
	if y < -110:
		GameManager.next_level()


func _on_timer_timeout() -> void:
	if star == 0:
		star_1.position.x = x + 10 * direction
		star_1.position.y = y + 5
		star_1.visible = true
	if star == 1:
		star_2.position.x = x + 10 * direction
		star_2.position.y = y + 5
		star_2.visible = true
	if star == 2:
		star_3.position.x = x + 10 * direction
		star_3.position.y = y + 5
		star_3.visible = true
	if star == 3:
		star_4.position.x = x + 10 * direction
		star_4.position.y = y + 5
		star_4.visible = true
	if star == 4:
		star_5.position.x = x + 10 * direction
		star_5.position.y = y + 5
		star_5.visible = true
	if star == 5:
		star_6.position.x = x + 10 * direction
		star_6.position.y = y + 5
		star_6.visible = true
	if star == 6:
		star_7.position.x = x + 10 * direction
		star_7.position.y = y + 5
		star_7.visible = true
	if star == 7:
		star_8.position.x = x + 10 * direction
		star_8.position.y = y + 5
		star_8.visible = true
	if star == 8:
		star_9.position.x = x + 10 * direction
		star_9.position.y = y + 5
		star_9.visible = true
	if star == 9:
		star_10.position.x = x + 10 * direction
		star_10.position.y = y + 5
		star_10.visible = true
	if star < 10:
		star += 1
