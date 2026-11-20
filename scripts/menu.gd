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
