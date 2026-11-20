extends Control

@onready var slider: HSlider = $VBoxContainer/VolumeSlider
@onready var back: Button = $VBoxContainer/Back

func _ready() -> void:
	slider.value = GameSettings.volume
	slider.value_changed.connect(GameSettings.set_value)
	slider.drag_ended.connect(func(_changed): GameSettings.save())
	back.pressed.connect(func(): get_tree().change_scene_to_file("res://scenes/menu.tscn"))
	slider.grab_focus()
