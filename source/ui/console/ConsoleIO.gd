class_name ConsoleIO
extends Node

signal print_text(character)
signal clear_screen

func print_text(text):
	emit_signal("print_text", text)

func clear():
	emit_signal("clear_screen")


