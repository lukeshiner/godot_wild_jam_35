extends Node

var console_io = load("res://ui/console/ConsoleIO.gd").new()

enum windows {CONSOLE, ROBOT, FILESYSTEM}
var active_window = windows.CONSOLE
