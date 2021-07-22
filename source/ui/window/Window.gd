class_name ScreenWindow
extends Panel

export(String) var view_scene_path

var inactive_stylebox = preload("res://ui/window/inactive_stylebox.tres")
var active_stylebox = preload("res://ui/window/active_stylebox.tres")

func show_active():
	print("Focus: ", name)
	set("custom_styles/panel", active_stylebox)

func show_inactive():
	set("custom_styles/panel", inactive_stylebox)
