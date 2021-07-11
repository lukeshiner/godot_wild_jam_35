extends Control

onready var console_screen = $VBoxContainer/TopSection/PanelTopLeft/MarginContainer/Console.console_input
onready var robot_screen = $VBoxContainer/TopSection/PanelTopRight/RobotScreen

var active_window setget set_active_window

func _ready():
	set_active_window(console_screen)

func set_active_window(window):
	active_window = window
	active_window.grab_focus()

func _unhandled_input(event):
	if event.is_action_pressed("select_console_screen"):
		set_active_window(console_screen)
	elif event.is_action_pressed("select_robot_screen"):
		set_active_window(robot_screen)
