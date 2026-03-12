extends Control


@onready var main_buttons: VBoxContainer = $MainButtons
@onready var options: Panel = $Options
@onready var advancements: Panel = $advancements
var scene = 0
var button = 0
var options_button = 0
@onready var v_slider: VSlider = $advancements/VSlider

@onready var controller: CheckBox = $Options/Controller

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scene = 0
	options.visible = false
	main_buttons.visible = true
	advancements.visible = false
	
	if GameManager.mouse == true:
		controller.button_pressed = false
	else:
		controller.button_pressed = true
	
	
	if PlayerData.advancements[1] == 0:
		_1.visible = false
	else:
		_1.visible = true
	if PlayerData.advancements[2] == 0:
		_2.visible = false
	else:
		_2.visible = true
	if PlayerData.advancements[3] == 0:
		_3.visible = false
	else:
		_3.visible = true
	if PlayerData.advancements[4] == 0:
		_4.visible = false
	else:
		_4.visible = true
	if PlayerData.advancements[5] == 0:
		_5.visible = false
	else:
		_5.visible = true
	if PlayerData.advancements[6] == 0:
		_6.visible = false
	else:
		_6.visible = true
	if PlayerData.advancements[7] == 0:
		_7.visible = false
	else:
		_7.visible = true
	if PlayerData.advancements[8] == 0:
		_8.visible = false
	else:
		_8.visible = true
	if PlayerData.advancements[9] == 0:
		_9.visible = false
	else:
		_9.visible = true
	if PlayerData.advancements[10] == 0:
		_10.visible = false
	else:
		_10.visible = true
	if PlayerData.advancements[11] == 0:
		_11.visible = false
	else:
		_11.visible = true

@onready var button_1: Button = $MainButtons/Button
@onready var button_2: Button = $MainButtons/Button3
@onready var button_3: Button = $MainButtons/Button2

@onready var music: HSlider = $Options/Music
@onready var sfx: HSlider = $Options/SFX
@onready var fullscreen_control: CheckBox = $Options/FullscreenControl

func _process(delta: float) -> void:
	if GameManager.mouse == false:
		if scene == 0:
			if button == 0:
				button_1.self_modulate = Color(1.289, 1.289, 1.289)
				button_2.self_modulate = "ffffff"
				button_3.self_modulate = "ffffff"
			elif button == 1:
				button_1.self_modulate = "ffffff"
				button_2.self_modulate = Color(1.289, 1.289, 1.289)
				button_3.self_modulate = "ffffff"
			else:
				button_1.self_modulate = "ffffff"
				button_2.self_modulate = "ffffff"
				button_3.self_modulate = Color(1.289, 1.289, 1.289)
		elif scene == 1:
			if options_button == 0:
				controller.self_modulate = "00fb00"
				music.self_modulate = "ffffff"
				sfx.self_modulate = "ffffff"
				fullscreen_control.self_modulate = "ffffff"
			elif options_button == 1:
				controller.self_modulate = "ffffff"
				music.self_modulate = Color(1.812, 1.812, 1.812)
				sfx.self_modulate = "ffffff"
				fullscreen_control.self_modulate = "ffffff"
			elif options_button == 2:
				controller.self_modulate = "ffffff"
				music.self_modulate = "ffffff"
				sfx.self_modulate = Color(1.812, 1.812, 1.812)
				fullscreen_control.self_modulate = "ffffff"
			else:
				controller.self_modulate = "ffffff"
				music.self_modulate = "ffffff"
				sfx.self_modulate = "ffffff"
				fullscreen_control.self_modulate = "00fb00"


func _input(event):
	if GameManager.mouse == false:
		if scene == 0:
			if event.is_action_pressed("jump"):
				if button == 0:
					_on_start_pressed()
				elif button == 1:
					_on_options_pressed()
				else:
					_on_quit_pressed()
			elif event.is_action_pressed("up"):
				if button < 3:
					button += 1
			elif event.is_action_pressed("down"):
				if button > 0:
					button -= 1
		elif scene == 1:
			if event.is_action_pressed("jump"):
				if options_button == 3:
					if fullscreen_control.button_pressed == true:
						fullscreen_control.button_pressed = false
					else:
						fullscreen_control.button_pressed = true
				elif options_button == 0:
					if controller.button_pressed == true:
						controller.button_pressed = false
					else:
						controller.button_pressed = true
			elif event.is_action_pressed("right"):
				if options_button == 1:
					music.value += 0.05
				elif options_button == 2:
					sfx.value += 0.05
			elif event.is_action_pressed("left"):
				if options_button == 1:
					music.value -= 0.05
				elif options_button == 2:
					sfx.value -= 0.05
			elif event.is_action_pressed("up"):
				if options_button < 4:
					options_button += 1
			elif event.is_action_pressed("down"):
				if options_button > 0:
					options_button -= 1
		elif scene == 2:
			if event.is_action_pressed("up"):
				v_slider.value -= 1
			elif event.is_action_pressed("down"):
				v_slider.value += 1


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Area Functionality/main_menu1.tscn")


func _on_quit_pressed() -> void:
	main_buttons.visible = false
	advancements.visible = true
	scene = 2



func _on_options_pressed() -> void:
	main_buttons.visible = false
	options.visible = true
	scene = 1


func _on_quit_options_pressed() -> void:
	_ready()

@onready var _1: Label = $"advancements/1"
@onready var _2: Label = $"advancements/2"
@onready var _3: Label = $"advancements/3"
@onready var _4: Label = $"advancements/4"
@onready var _5: Label = $"advancements/5"
@onready var _6: Label = $"advancements/6"
@onready var _7: Label = $"advancements/7"
@onready var _8: Label = $"advancements/8"
@onready var _9: Label = $"advancements/9"
@onready var _10: Label = $"advancements/10"
@onready var _11: Label = $"advancements/11"


func _on_v_slider_value_changed(value: float) -> void:
	_1.position.y = value * 10 - 500
	_2.position.y = value * 10 - 400
	_3.position.y = value * 10 - 300
	_4.position.y = value * 10 - 200
	_5.position.y = value * 10 - 100
	_6.position.y = value * 10
	_7.position.y = value * 10 + 100
	_8.position.y = value * 10 + 200
	_9.position.y = value * 10 + 300
	_10.position.y = value * 10 + 400
	_11.position.y = value * 10 + 500
	
	if PlayerData.advancements[1] == 0:
		_1.visible = false
	else:
		_1.visible = true
	if PlayerData.advancements[2] == 0:
		_2.visible = false
	else:
		_2.visible = true
	if PlayerData.advancements[3] == 0:
		_3.visible = false
	else:
		_3.visible = true
	if PlayerData.advancements[4] == 0:
		_4.visible = false
	else:
		_4.visible = true
	if PlayerData.advancements[5] == 0:
		_5.visible = false
	else:
		_5.visible = true
	if PlayerData.advancements[6] == 0:
		_6.visible = false
	else:
		_6.visible = true
	if PlayerData.advancements[7] == 0:
		_7.visible = false
	else:
		_7.visible = true
	if PlayerData.advancements[8] == 0:
		_8.visible = false
	else:
		_8.visible = true
	if PlayerData.advancements[9] == 0:
		_9.visible = false
	else:
		_9.visible = true
	if PlayerData.advancements[10] == 0:
		_10.visible = false
	else:
		_10.visible = true
	if PlayerData.advancements[11] == 0:
		_11.visible = false
	else:
		_11.visible = true


func _on_controller_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		GameManager.mouse = false
	else:
		GameManager.mouse = true
		controller.self_modulate = "ffffff"
		music.self_modulate = "ffffff"
		sfx.self_modulate = "ffffff"
		fullscreen_control.self_modulate = "ffffff"
