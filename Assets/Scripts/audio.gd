extends HSlider

@export var audio_bus_name:String

var audio_bus_id

func _ready() -> void:
	GameManager.key = 0
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)
	if audio_bus_name == "Music":
		value = PlayerData.MUSIC * 0.001
	elif audio_bus_name == "SFX":
		value = PlayerData.SFX * 0.001

func _on_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(audio_bus_id,db)
	if audio_bus_name == "Music":
		PlayerData.MUSIC = value * 1000
	elif audio_bus_name == "SFX":
		PlayerData.SFX = value * 1000
	SaveManager.save_game(SaveManager.data)
