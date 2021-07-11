extends Control

onready var windows = {
	Global.windows.CONSOLE: $VBoxContainer/TopSection/PanelTopLeft/ViewportContainer/Viewport/Console.console_input,
	Global.windows.ROBOT: $VBoxContainer/TopSection/PanelTopRight/RobotScreen
}

var active_window setget set_active_window

func _ready():
	set_active_window(Global.windows.CONSOLE)

func set_active_window(window):
	Global.active_window = window
	windows[window].grab_focus()

func _unhandled_input(event):
	if event.is_action_pressed("select_console_screen"):
		set_active_window(Global.windows.CONSOLE)
	elif event.is_action_pressed("select_robot_screen"):
		set_active_window(Global.windows.ROBOT)
