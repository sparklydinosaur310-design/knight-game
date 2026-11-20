extends Node

const PATH = "user://settings.cfg"
var volume := 0.8

func _ready() -> void:
	var config = ConfigFile.new()
	if config.load(PATH) == OK:
		volume = config.get_value("audio", "volume", 0.8)
	apply()

func set_volume(value: float) -> void:
	volume = value
	apply()

func apply() -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db(maxf(volume, 0.0001)))
	AudioServer.set_bus_mute(0, volume <= 0.001)

func save() -> void:
	var config = ConfigFile.new()
	config.set_value("audio", "volume", volume)
	config.save(PATH)
