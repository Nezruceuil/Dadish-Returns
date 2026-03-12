extends Node

@export var has_started = false

@export var mouse = true

@export var pos_x = 0
@export var pos_y = 0

@export var pause = false

@export var current_player = 0
@export var player_y_added = 1

@export var has_dialogue = true

@export var camera = 0

@export var fall = false

@export var has_star = 0

@export var key = 0
@export var button =  [0,0,0,0,0,0,0,0,0,0]

var current_area = 1
var area_path = "res://Assets/Scenes/Areas/"

@export var  die = false

@export var Boss = false

@export var total_time = 0

func next_level():
	Dialogue.kid = false
	pause = false
	PlayerData.world = round((current_area - 5) / 10.0)
	if not current_area == 30:
		has_dialogue = true
		current_player = 0
		pause = false
		key = 0
		if current_area % 10 == 0:
			PlayerData.level[current_area] = 2
		else:
			if not PlayerData.level[current_area] == 3:
				if has_star == 1:
					PlayerData.level[current_area] = 3
				else:
					PlayerData.level[current_area] = 2
				if current_area + 1 > PlayerData.level_done:
					PlayerData.level_done = current_area + 2
		if has_star == 1:
			PlayerData.star_count += 1
			has_star = 0
		current_area += 1
		var full_path = area_path + "area_" + str(current_area) + ".tscn"
		get_tree().change_scene_to_file(full_path)
		print("Player has move to area " + str(current_area))
	else:
		PlayerData.advancements[8] = 1
		if PlayerData.star_count == 27:
			PlayerData.advancements[8] = 1
		get_tree().change_scene_to_file("res://Assets/Scenes/Area Functionality/main_menu1.tscn")
	if PlayerData.times[current_area-2] > total_time:
		PlayerData.times[current_area-2] = total_time
	SaveManager.save_game(SaveManager.data)
	total_time = 0

func respawn():
	Dialogue.kid = false
	pause = false
	total_time = 0
	has_dialogue = false
	current_player = 0
	key = 0
	if has_star == 1:
		has_star = 0
	die = false
	var full_path = area_path + "area_" + str(current_area) + ".tscn"
	get_tree().change_scene_to_file(full_path)
	print("Player respawn")
	pause = false

func spawn():
	Dialogue.kid = false
	pause = false
	total_time = 0
	has_dialogue = true
	current_player = 0
	var full_path = area_path + "area_" + str(current_area) + ".tscn"
	get_tree().change_scene_to_file(full_path)
	has_star = 0
	key = 0
	pause = false



func star():
	has_star = 1
	print("Player has " + str(PlayerData.star_count+has_star) + " stars !")
	PlayerData.advancements[1] = 1

@export var special_jump = false
@export var special_jump_identity = false
