extends Control

@onready var title: Label = $Title
@onready var start: Button = $VBoxContainer/Start
@onready var quit: Button = $VBoxContainer/Quit

func _ready() -> void:
	start.grab_focus()
	if OS.has_feature("web"):
		quit.visible = false
		
	var y = title.position.y
	var t = create_tween().set_loops()
	t.tween_property(title, "position:y", y - 20, 0.8).set_trans(Tween.TRANS_SINE)
	t.tween_property(title, "position:y", y, 0.8).set_trans(Tween.TRANS_SINE)

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
