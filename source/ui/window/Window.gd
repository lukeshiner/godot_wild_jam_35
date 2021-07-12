extends Panel

export(String) var view_scene_path

onready var view_scene = load(view_scene_path)

var inactive_stylebox = preload("res://ui/window/inactive_stylebox.tres")
var active_stylebox = preload("res://ui/window/active_stylebox.tres")

func _ready():
	$MarginContainer/ViewportContainer/Viewport.add_child(view_scene.instance())

func show_active():
	print("Focus: ", name)
	set("custom_styles/panel", active_stylebox)

func show_inactive():
	set("custom_styles/panel", inactive_stylebox)
