extends Control

const LEVELS = [
	"res://scenes/levels/level_1.tscn",
	"res://scenes/levels/level_2.tscn",
	"res://scenes/levels/level_3.tscn",
]

@onready var buttons: Array[Button] = [
	$VBoxContainer/Level1,
	$VBoxContainer/Level2,
	$VBoxContainer/Level3,
]
@onready var back: Button = $VBoxContainer/Back

func _ready() -> void:
	for i in buttons.size():
		var path = LEVELS[i]
		if ResourceLoader.exists(path):
			buttons[i].pressed.connect(func(): get_tree().change_scene_to_file(path))
		else:
			buttons[i].disabled = true
			buttons[i].text = "Level %d (soon)" % (i + 1)
	back.pressed.connect(func(): get_tree().change_scene_to_file("res://scenes/menu.tscn"))
	for b in buttons:
		if not b.disabled:
			b.grab_focus()
			break
		if not get_viewport().gui_get_focus_owner():
			back.grab_focus()
