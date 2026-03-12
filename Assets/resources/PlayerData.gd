extends Node2D
class_name  player_data

@export var level_done := 1
@export var star_count := 0
@export var level := [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
@export var advancements := [0,0,0,0,0,0,0,0,0,0,0,0]
@export var world := 0
@export var character := 0
@export var times = []

@export var SFX = 500
@export var MUSIC = 500

func _ready():
	times.resize(50)
	times.fill(100000)
	SaveManager.load_game()
