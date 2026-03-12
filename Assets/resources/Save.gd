extends Node
# Chemin du fichier de sauvegarde
const SAVE_PATH := "user://save.json"
@export var data = {}

# Save
func save_game(data: Dictionary) -> void:
	data = {
		level_done = PlayerData.level_done,
		level = PlayerData.level,
		advancements = PlayerData.advancements,
		star_count = PlayerData.star_count,
		world =  PlayerData.world,
		character = PlayerData.character,
		times = PlayerData.times,
		SFX = PlayerData.SFX,
		MUSIC = PlayerData.MUSIC
	}
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file == null:
		push_error("Cannot read file : " + SAVE_PATH)
		return
	file.store_string(JSON.stringify(data, "\t"))
	file.close()
	print("Save worked !")


# load
func load_game() -> Dictionary:
	if not FileAccess.file_exists(SAVE_PATH):
		print("No Save found")
		return {}
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file == null:
		push_error("Cannot read save file")
		return {}
	var content := file.get_as_text()
	file.close()
	var parsed: Variant = JSON.parse_string(content)
	if parsed == null or not parsed is Dictionary:
		push_error("corrupted or invalid")
		return {}
	var save_data := parsed as Dictionary
	print("Save worked")
	PlayerData.advancements = Array(save_data.get("advancements", []))
	PlayerData.level = Array(save_data.get("level", []))
	PlayerData.times = Array(save_data.get("times", []))
	PlayerData.level_done = save_data.get("level_done", [])
	PlayerData.star_count = save_data.get("star_count", [])
	PlayerData.world = save_data.get("world", [])
	PlayerData.character = save_data.get("character", [])
	PlayerData.SFX = save_data.get("SFX", [])
	PlayerData.MUSIC = save_data.get("MUSIC", [])
	return save_data

# Save exist ?
func has_save() -> bool:
	return FileAccess.file_exists(SAVE_PATH)
