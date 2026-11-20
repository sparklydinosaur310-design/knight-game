extends Control

@onready var title: Label = $Title
@onready var start: Button = $VBoxContainer/Start
@onready var settings: Button = $VBoxContainer/Settings
@onready var quit: Button = $VBoxContainer/Quit

func _ready() -> void:
	print("menu ready")
	start.grab_focus()
	start.pressed.connect(func():
		print("start pressed")
		get_tree().change_scene_to_file("res://scenes/level_select.tscn"))
	if OS.has_feature("web"):
		quit.visible = false
		
		start.pressed.connect(func(): get_tree().change_scene_to_file("res://scenes/level_select.tscn"))
		settings.pressed.connect(func(): get_tree().change_scene_to_file("res://scenes/settings.tscn"))
		quit.pressed.connect(func(): get_tree().quit())
		
	var y = title.position.y
	var t = create_tween().set_loops()
	t.tween_property(title, "position:y", y - 20, 0.8).set_trans(Tween.TRANS_SINE)
	t.tween_property(title, "position:y", y, 0.8).set_trans(Tween.TRANS_SINE)
