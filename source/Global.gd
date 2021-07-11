extends Node

var console_io = load("res://ui/console/ConsoleIO.gd").new()

func _ready():
	console_io.clear()
	console_io.print_text("""
	In this lesson, we will look at signals. They are messages that nodes emit when something specific happens to them, like a button being pressed. Other nodes can connect to that signal and call a function when the event occurs.

It is a delegation mechanism built into Godot that allows one game object to react to a change in another without them referencing one another. Using signals limits coupling and keeps your code flexible.

For example, you might have a life bar on the screen that represents the player’s health. When the player takes damage or uses a healing potion, you want the bar to reflect the change. To do so, in Godot, you would use signals.
	""")
