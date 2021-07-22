extends Control

var buffer = []

onready var console_input = $VBoxContainer/HBoxContainer/ConsoleInput
onready var console_output = $VBoxContainer/ConsoleOutput
onready var enter_button = $VBoxContainer/HBoxContainer/EnterButton

func _ready():
	Global.console_io.connect("print_text", self, "_on_print_text")
	Global.console_io.connect("clear_screen", self, "_on_clear_screen")

func _on_print_text(text):
	for character in text:
		buffer.append(character)

func _on_clear_screen():
	buffer = []
	console_output.text = ""

func _on_Timer_timeout():
	if buffer.size() > 0:
		console_output.text += buffer.pop_front()


func _on_ConsoleWindow_focus_entered():
	focus()


func _on_ConsoleWindow_focus_exited():
	defocus()

func defocus():
	console_input.set_focus_mode(1)
	console_output.set_focus_mode(1)
	enter_button.set_focus_mode(1)
	release_focus()
	console_input.release_focus()
	console_output.release_focus()
	enter_button.release_focus()

func focus():
	console_input.set_focus_mode(2)
	console_output.set_focus_mode(2)
	enter_button.set_focus_mode(2)
	console_input.grab_focus()
