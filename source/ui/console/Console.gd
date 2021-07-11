extends Control

var buffer = []

onready var console_input = $VBoxContainer/HBoxContainer/ConsoleInput
onready var console_output = $VBoxContainer/ConsoleOutput

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
