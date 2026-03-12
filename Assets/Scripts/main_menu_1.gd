extends Control

@onready var node_2d: Node2D = $Node2D

@onready var button_1: Button = $"face_1/Button"
@onready var button_2: Button = $"face_1/Button2"
@onready var button_3: Button = $"face_1/Button3"
@onready var button_4: Button = $"face_1/Button4"
@onready var button_5: Button = $"face_1/Button5"
@onready var button_6: Button = $"face_1/Button6"
@onready var button_7: Button = $"face_1/Button7"
@onready var button_8: Button = $"face_1/Button8"
@onready var button_9: Button = $"face_1/Button9"
@onready var button_10: Button = $"face_1/Button10"
@onready var button_11: Button = $face_2/Button11
@onready var button_12: Button = $face_2/Button12
@onready var button_13: Button = $face_2/Button13
@onready var button_14: Button = $face_2/Button14
@onready var button_15: Button = $face_2/Button15
@onready var button_16: Button = $face_2/Button16
@onready var button_17: Button = $face_2/Button17
@onready var button_18: Button = $face_2/Button18
@onready var button_19: Button = $face_2/Button19
@onready var button_20: Button = $face_2/Button20
@onready var button_21: Button = $face_3/Button21
@onready var button_22: Button = $face_3/Button22
@onready var button_23: Button = $face_3/Button23
@onready var button_24: Button = $face_3/Button24
@onready var button_25: Button = $face_3/Button25
@onready var button_26: Button = $face_3/Button26
@onready var button_27: Button = $face_3/Button27
@onready var button_28: Button = $face_3/Button28
@onready var button_29: Button = $face_3/Button29
@onready var button_30: Button = $face_3/Button30

@onready var button_10b: Button = $face_1/Button10b
@onready var button_20b: Button = $face_2/Button20b
@onready var button_30b: Button = $face_3/Button30b


@onready var character: CheckButton = $Node2D/Character

@onready var total_time: Label = $Node2D/total_time
var totaltime = 0

func _ready() -> void:
	if PlayerData.advancements[8] == 0:
		character.visible = false
	else:
		character.visible = true
		if PlayerData.character == 1:
			character.button_pressed = true
		else:
				character.button_pressed = false
	
	node_2d.position.x = 0
	if PlayerData.world == 1:
		node_2d.move_local_x(1152)
	elif PlayerData.world == 2:
		node_2d.move_local_x(2304)
	elif PlayerData.world == 3:
		node_2d.move_local_x(3456)
	totaltime += PlayerData.times[0] + PlayerData.times[1] + PlayerData.times[2] + PlayerData.times[3] + PlayerData.times[4] + PlayerData.times[5] + PlayerData.times[6] + PlayerData.times[7] + PlayerData.times[8] + PlayerData.times[9]
	totaltime += PlayerData.times[10] + PlayerData.times[11] + PlayerData.times[12] + PlayerData.times[13] + PlayerData.times[14] + PlayerData.times[15] + PlayerData.times[16] + PlayerData.times[17] + PlayerData.times[18] + PlayerData.times[19]
	totaltime += PlayerData.times[20] + PlayerData.times[21] + PlayerData.times[22] + PlayerData.times[23] + PlayerData.times[24] + PlayerData.times[25] + PlayerData.times[26] + PlayerData.times[27] + PlayerData.times[28] + PlayerData.times[29]
	total_time.text = "Total Time: "+str(totaltime*0.01)

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Area Functionality/main_menu.tscn")


func _on_character_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		PlayerData.character = 1
	else:
		PlayerData.character = 0

func _process(delta: float) -> void:
	if PlayerData.level[1] == 2:
		button_1.self_modulate = "00cd00"
	elif PlayerData.level[1] == 3:
		button_1.self_modulate = "ffff00"
	else:
		button_1.self_modulate = "494949"
	
	if PlayerData.level[2] == 2:
		button_2.self_modulate = '00cd00'
	elif PlayerData.level[2] == 3:
		button_2.self_modulate = 'ffff00'
	else:
		button_2.self_modulate = '494949'
	
	if PlayerData.level[3] == 2:
		button_3.self_modulate = '00cd00'
	elif PlayerData.level[3] == 3:
		button_3.self_modulate = 'ffff00'
	else:
		button_3.self_modulate = '494949'
	
	if PlayerData.level[4] == 2:
		button_4.self_modulate = '00cd00'
	elif PlayerData.level[4] == 3:
		button_4.self_modulate = 'ffff00'
	else:
		button_4.self_modulate = '494949'
	
	if PlayerData.level[5] == 2:
		button_5.self_modulate = '00cd00'
	elif PlayerData.level[5] == 3:
		button_5.self_modulate = 'ffff00'
	else:
		button_5.self_modulate = '494949'
	
	if PlayerData.level[6] == 2:
		button_6.self_modulate = '00cd00'
	elif PlayerData.level[6] == 3:
		button_6.self_modulate = 'ffff00'
	else:
		button_6.self_modulate = '494949'
	
	if PlayerData.level[7] == 2:
		button_7.self_modulate = '00cd00'
	elif PlayerData.level[7] == 3:
		button_7.self_modulate = 'ffff00'
	else:
		button_7.self_modulate = '494949'
	
	if PlayerData.level[8] == 2:
		button_8.self_modulate = '00cd00'
	elif PlayerData.level[8] == 3:
		button_8.self_modulate = 'ffff00'
	else:
		button_8.self_modulate = '494949'
	
	if PlayerData.level[9] == 2:
		button_9.self_modulate = '00cd00'
	elif PlayerData.level[9] == 3:
		button_9.self_modulate = 'ffff00'
	else:
		button_9.self_modulate = '494949'
	
	if PlayerData.level[10] == 2:
		button_10b.disabled = true
		button_10.disabled = false
	else:
		button_10b.disabled = true
		button_10.disabled = false
	
	if PlayerData.level[11] == 2:
		button_11.self_modulate = '00cd00'
	elif PlayerData.level[11] == 3:
		button_11.self_modulate = "ffff00"
	else:
		button_11.self_modulate = '494949'
	
	if PlayerData.level[12] == 2:
		button_12.self_modulate = '00cd00'
	elif PlayerData.level[12] == 3:
		button_12.self_modulate = 'ffff00'
	else:
		button_12.self_modulate = '494949'
	
	if PlayerData.level[13] == 2:
		button_13.self_modulate = '00cd00'
	elif PlayerData.level[13] == 3:
		button_13.self_modulate = 'ffff00'
	else:
		button_13.self_modulate = '494949'
	
	if PlayerData.level[14] == 2:
		button_14.self_modulate = '00cd00'
	elif PlayerData.level[14] == 3:
		button_14.self_modulate = 'ffff00'
	else:
		button_14.self_modulate = '494949'
	
	if PlayerData.level[15] == 2:
		button_15.self_modulate = '00cd00'
	elif PlayerData.level[15] == 3:
		button_15.self_modulate = 'ffff00'
	else:
		button_15.self_modulate = '494949'
	
	if PlayerData.level[16] == 2:
		button_16.self_modulate = '00cd00'
	elif PlayerData.level[16] == 3:
		button_16.self_modulate = 'ffff00'
	else:
		button_16.self_modulate = '494949'
	
	if PlayerData.level[17] == 2:
		button_17.self_modulate = '00cd00'
	elif PlayerData.level[17] == 3:
		button_17.self_modulate = 'ffff00'
	else:
		button_17.self_modulate = '494949'
	
	if PlayerData.level[18] == 2:
		button_18.self_modulate = '00cd00'
	elif PlayerData.level[18] == 3:
		button_18.self_modulate = 'ffff00'
	else:
		button_18.self_modulate = '494949'
	
	if PlayerData.level[19] == 2:
		button_19.self_modulate = '00cd00'
	elif PlayerData.level[19] == 3:
		button_19.self_modulate = 'ffff00'
	else:
		button_19.self_modulate = '494949'
	
	if PlayerData.level[20] == 2:
		button_20b.disabled = true
		button_20.disabled = false
	else:
		button_20b.disabled = true
		button_20.disabled = false
	
	if PlayerData.level[21] == 2:
		button_21.self_modulate = '00cd00'
	elif PlayerData.level[21] == 3:
		button_21.self_modulate = "ffff00"
	else:
		button_21.self_modulate = '494949'
	
	if PlayerData.level[22] == 2:
		button_22.self_modulate = '00cd00'
	elif PlayerData.level[22] == 3:
		button_22.self_modulate = 'ffff00'
	else:
		button_22.self_modulate = '494949'
	
	if PlayerData.level[23] == 2:
		button_23.self_modulate = '00cd00'
	elif PlayerData.level[23] == 3:
		button_23.self_modulate = 'ffff00'
	else:
		button_23.self_modulate = '494949'
	
	if PlayerData.level[24] == 2:
		button_24.self_modulate = '00cd00'
	elif PlayerData.level[24] == 3:
		button_24.self_modulate = 'ffff00'
	else:
		button_24.self_modulate = '494949'
	
	if PlayerData.level[25] == 2:
		button_25.self_modulate = '00cd00'
	elif PlayerData.level[25] == 3:
		button_25.self_modulate = 'ffff00'
	else:
		button_25.self_modulate = '494949'
	
	if PlayerData.level[26] == 2:
		button_26.self_modulate = '00cd00'
	elif PlayerData.level[26] == 3:
		button_26.self_modulate = 'ffff00'
	else:
		button_26.self_modulate = '494949'
	
	if PlayerData.level[27] == 2:
		button_27.self_modulate = '00cd00'
	elif PlayerData.level[27] == 3:
		button_27.self_modulate = 'ffff00'
	else:
		button_27.self_modulate = '494949'
	
	if PlayerData.level[28] == 2:
		button_28.self_modulate = '00cd00'
	elif PlayerData.level[28] == 3:
		button_28.self_modulate = 'ffff00'
	else:
		button_28.self_modulate = '494949'
	
	if PlayerData.level[29] == 2:
		button_29.self_modulate = '00cd00'
	elif PlayerData.level[29] == 3:
		button_29.self_modulate = 'ffff00'
	else:
		button_29.self_modulate = '494949'
	
	if PlayerData.level[30] == 2:
		button_30b.disabled = true
		button_30.disabled = false
	else:
		button_30b.disabled = true
		button_30.disabled = false
	
	
	


var button = 0
var button_list = [Color(6.775, 6.775, 6.775),"ffffff","ffffff","ffffff","ffffff","ffffff","ffffff","ffffff","ffffff","ffffff"]
var press = 0

func _input(event):
	if GameManager.mouse == false:
		if event.is_action_pressed("next_world"):
			if PlayerData.world < 3:
				if PlayerData.level_done  >= (PlayerData.world + 1) * 10:
					PlayerData.world += 1
					node_2d.move_local_x(1152)
		elif event.is_action_pressed("previous_world"):
			if PlayerData.world > 0:
				PlayerData.world -= 1
				node_2d.move_local_x(-1152)
		
		elif event.is_action_pressed("left"):
			if button > 0:
				button_list[button] = "ffffff"
				button -= 1
				button_list[button] = Color(6.775, 6.775, 6.775)
		elif event.is_action_pressed("right"):
			if button < 9:
				button_list[button] = "ffffff"
				button += 1
				button_list[button] = Color(6.775, 6.775, 6.775)
		
		if event.is_action_pressed("jump"):
			press = button + (PlayerData.world * 10) + 1
			if press == 1:
				_on_button1_pressed()
			elif press == 2:
				_on_button_2_pressed()
			elif press == 3:
				_on_button_3_pressed()
			elif press == 4:
				_on_button_4_pressed()
			elif press == 5:
				_on_button_5_pressed()
			elif press == 6:
				_on_button_6_pressed()
			elif press == 7:
				_on_button_7_pressed()
			elif press == 8:
				_on_button_8_pressed()
			elif press == 9:
				_on_button_9_pressed()
			elif press == 10:
				_on_button_10_pressed()
			elif press == 11:
				_on_button_11_pressed()
			elif press == 12:
				_on_button_12_pressed()
			elif press == 13:
				_on_button_13_pressed()
			elif press == 14:
				_on_button_14_pressed()
			elif press == 15:
				_on_button_15_pressed()
			elif press == 16:
				_on_button_16_pressed()
			elif press == 17:
				_on_button_17_pressed()
			elif press == 18:
				_on_button_18_pressed()
			elif press == 19:
				_on_button_19_pressed()
			elif press == 20:
				_on_button_20_pressed()
			elif press == 21:
				_on_button_21_pressed()
			elif press == 22:
				_on_button_22_pressed()
			elif press == 23:
				_on_button_23_pressed()
			elif press == 24:
				_on_button_24_pressed()
			elif press == 25:
				_on_button_25_pressed()
			elif press == 26:
				_on_button_26_pressed()
			elif press == 27:
				_on_button_27_pressed()
			elif press == 28:
				_on_button_28_pressed()
			elif press == 29:
				_on_button_29_pressed()
			elif press == 30:
				_on_button_30_pressed()
		
		button_1.modulate = button_list[0]
		button_11.modulate = button_list[0]
		button_21.modulate = button_list[0]
		
		button_2.modulate = button_list[1]
		button_12.modulate = button_list[1]
		button_22.modulate = button_list[1]
		
		button_3.modulate = button_list[2]
		button_13.modulate = button_list[2]
		button_23.modulate = button_list[2]
		
		button_4.modulate = button_list[3]
		button_14.modulate = button_list[3]
		button_24.modulate = button_list[3]
		
		button_5.modulate = button_list[4]
		button_15.modulate = button_list[4]
		button_25.modulate = button_list[4]
		
		button_6.modulate = button_list[5]
		button_16.modulate = button_list[5]
		button_26.modulate = button_list[5]
		
		button_7.modulate = button_list[6]
		button_17.modulate = button_list[6]
		button_27.modulate = button_list[6]
		
		button_8.modulate = button_list[7]
		button_18.modulate = button_list[7]
		button_28.modulate = button_list[7]
		
		button_9.modulate = button_list[8]
		button_19.modulate = button_list[8]
		button_29.modulate = button_list[8]
		
		button_10.modulate = button_list[9]
		button_20.modulate = button_list[9]
		button_30.modulate = button_list[9]
		
		button_10b.modulate = button_list[9]
		button_20b.modulate = button_list[9]
		button_30b.modulate = button_list[9]




func _on_right_pressed() -> void:
	if PlayerData.world > 0:
		button_list[button] = "ffffff"
		button = 0
		if GameManager.mouse == false:
			button_list[button] = Color(6.775, 6.775, 6.775)
		PlayerData.world -= 1
		node_2d.move_local_x(-1152)
		SaveManager.save_game(SaveManager.data)

func _on_left_pressed() -> void:
	if PlayerData.world < 3:
		if PlayerData.level_done  <= (PlayerData.world + 1) * 10:
			button_list[button] = "ffffff"
			button = 0
			if GameManager.mouse == false:
				button_list[button] = Color(6.775, 6.775, 6.775)
			PlayerData.world += 1
			node_2d.move_local_x(1152)
			SaveManager.save_game(SaveManager.data)

var level = 1

func _on_button1_pressed() -> void:
	if not PlayerData.level_done < 1:
		GameManager.current_area = 1
		GameManager.spawn()
		if PlayerData.level_done == 1:
			PlayerData.level_done += 1


func _on_button_2_pressed() -> void:
	if not PlayerData.level_done < 2:
		GameManager.current_area = 2
		GameManager.spawn()
		if PlayerData.level_done == 2:
			PlayerData.level_done += 1



func _on_button_3_pressed() -> void:
	if not PlayerData.level_done < 3:
		GameManager.current_area = 3
		GameManager.spawn()
		if PlayerData.level_done == 3:
			PlayerData.level_done += 1


func _on_button_4_pressed() -> void:
	if not PlayerData.level_done < 4:
		GameManager.current_area = 4
		GameManager.spawn()
		if PlayerData.level_done == 4:
			PlayerData.level_done += 1


func _on_button_5_pressed() -> void:
	if not PlayerData.level_done < 5:
		GameManager.current_area = 5
		GameManager.spawn()
		if PlayerData.level_done == 5:
			PlayerData.level_done += 1


func _on_button_6_pressed() -> void:
	if not PlayerData.level_done < 6:
		GameManager.current_area = 6
		GameManager.spawn()
		if PlayerData.level_done == 6:
			PlayerData.level_done += 1


func _on_button_7_pressed() -> void:
	if not PlayerData.level_done < 7:
		GameManager.current_area = 7
		GameManager.spawn()
		if PlayerData.level_done == 7:
			PlayerData.level_done += 1


func _on_button_8_pressed() -> void:
	if not PlayerData.level_done < 8:
		GameManager.current_area = 8
		GameManager.spawn()
		if PlayerData.level_done == 8:
			PlayerData.level_done += 1


func _on_button_9_pressed() -> void:
	if not PlayerData.level_done < 9:
		GameManager.current_area = 9
		GameManager.spawn()
		if PlayerData.level_done == 9:
			PlayerData.level_done += 1



func _on_button_10_pressed() -> void:
	if not PlayerData.level_done < 10:
		GameManager.current_area = 10
		GameManager.spawn()
		if PlayerData.level_done == 10:
			PlayerData.level_done += 1



func _on_button_11_pressed() -> void:
	if not PlayerData.level_done < 11:
		GameManager.current_area = 11
		GameManager.spawn()
		if PlayerData.level_done == 11:
			PlayerData.level_done += 1



func _on_button_12_pressed() -> void:
	if not PlayerData.level_done < 12:
		GameManager.current_area = 12
		GameManager.spawn()
		if PlayerData.level_done == 12:
			PlayerData.level_done += 1



func _on_button_13_pressed() -> void:
	if not PlayerData.level_done < 13:
		GameManager.current_area = 13
		GameManager.spawn()
		if PlayerData.level_done == 13:
			PlayerData.level_done += 1



func _on_button_14_pressed() -> void:
	if not PlayerData.level_done < 14:
		GameManager.current_area = 14
		GameManager.spawn()
		if PlayerData.level_done == 14:
			PlayerData.level_done += 1



func _on_button_15_pressed() -> void:
	if not PlayerData.level_done < 15:
		GameManager.current_area = 15
		GameManager.spawn()
		if PlayerData.level_done == 15:
			PlayerData.level_done += 1



func _on_button_16_pressed() -> void:
	if not PlayerData.level_done < 16:
		GameManager.current_area = 16
		GameManager.spawn()
		if PlayerData.level_done == 16:
			PlayerData.level_done += 1



func _on_button_17_pressed() -> void:
	if not PlayerData.level_done < 17:
		GameManager.current_area = 17
		GameManager.spawn()
		if PlayerData.level_done == 17:
			PlayerData.level_done += 1


func _on_button_18_pressed() -> void:
	if not PlayerData.level_done < 18:
		GameManager.current_area = 18
		GameManager.spawn()
		if PlayerData.level_done == 18:
			PlayerData.level_done += 1


func _on_button_19_pressed() -> void:
	if not PlayerData.level_done < 19:
		GameManager.current_area = 19
		GameManager.spawn()
		if PlayerData.level_done == 19:
			PlayerData.level_done += 1



func _on_button_20_pressed() -> void:
	if not PlayerData.level_done < 20:
		GameManager.current_area = 20
		GameManager.spawn()
		if PlayerData.level_done == 20:
			PlayerData.level_done += 1

func _on_button_21_pressed() -> void:
	if not PlayerData.level_done < 21:
		GameManager.current_area = 21
		GameManager.spawn()
		if PlayerData.level_done == 21:
			PlayerData.level_done += 1

func _on_button_22_pressed() -> void:
	if not PlayerData.level_done < 22:
		GameManager.current_area = 22
		GameManager.spawn()
		if PlayerData.level_done == 22:
			PlayerData.level_done += 1

func _on_button_23_pressed() -> void:
	if not PlayerData.level_done < 23:
		GameManager.current_area = 23
		GameManager.spawn()
		if PlayerData.level_done == 23:
			PlayerData.level_done += 1

func _on_button_24_pressed() -> void:
	if not PlayerData.level_done < 24:
		GameManager.current_area = 24
		GameManager.spawn()
		if PlayerData.level_done == 24:
			PlayerData.level_done += 1

func _on_button_25_pressed() -> void:
	if not PlayerData.level_done < 25:
		GameManager.current_area = 25
		GameManager.spawn()
		if PlayerData.level_done == 25:
			PlayerData.level_done += 1

func _on_button_26_pressed() -> void:
	if not PlayerData.level_done < 26:
		GameManager.current_area = 26
		GameManager.spawn()
		if PlayerData.level_done == 26:
			PlayerData.level_done += 1

func _on_button_27_pressed() -> void:
	if not PlayerData.level_done < 27:
		GameManager.current_area = 27
		GameManager.spawn()
		if PlayerData.level_done == 27:
			PlayerData.level_done += 1

func _on_button_28_pressed() -> void:
	if not PlayerData.level_done < 28:
		GameManager.current_area = 28
		GameManager.spawn()
		if PlayerData.level_done == 28:
			PlayerData.level_done += 1

func _on_button_29_pressed() -> void:
	if not PlayerData.level_done < 29:
		GameManager.current_area = 29
		GameManager.spawn()
		if PlayerData.level_done == 29:
			PlayerData.level_done += 1

func _on_button_30_pressed() -> void:
	if not PlayerData.level_done < 30:
		GameManager.current_area = 30
		GameManager.spawn()
		if PlayerData.level_done == 30:
			PlayerData.level_done += 1
