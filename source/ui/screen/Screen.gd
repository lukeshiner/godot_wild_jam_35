extends Control

onready var windows = {
	Global.windows.CONSOLE: $VBoxContainer/TopSection/PanelTopLeft/ConsoleWindow,
	Global.windows.ROBOT: $VBoxContainer/TopSection/PanelTopRight/RobotWindow,
	Global.windows.FILESYSTEM: $VBoxContainer/BottomSection/PanelBottomLeft/FileSystemWindow,
}

var active_window setget set_active_window

func _ready():
	set_active_window(Global.windows.CONSOLE)

func set_active_window(window_name):
	Global.active_window = window_name
	for w in windows.values():
		w.show_inactive()
		w.release_focus()
		w.emit_signal("focus_exited")
	windows[window_name].grab_focus()
	windows[window_name].show_active()

func _unhandled_input(event):
	if event.is_action_pressed("select_console_screen"):
		set_active_window(Global.windows.CONSOLE)
	elif event.is_action_pressed("select_robot_screen"):
		set_active_window(Global.windows.ROBOT)
	elif event.is_action_pressed("select_filesystem_screen"):
		set_active_window(Global.windows.FILESYSTEM)
