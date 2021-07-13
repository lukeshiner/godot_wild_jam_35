extends Node

var robots = []
var active_robot = null

func add_robots(new_robots):
	robots = new_robots
	active_robot = robots[0]
	print(active_robot)

func _input(event):
	if Global.active_window != Global.windows.ROBOT:
		return
	if event.is_action_pressed("ui_up"):
		active_robot.input_direction = Vector2.UP
		Global.console_io.print_text("Move Robot %d Up.\n" % robots.find(active_robot))
	elif event.is_action_pressed("ui_down"):
		active_robot.input_direction = Vector2.DOWN
		Global.console_io.print_text("Move Robot %d Down.\n" % robots.find(active_robot))
	elif event.is_action_pressed("ui_left"):
		active_robot.input_direction = Vector2.LEFT
		Global.console_io.print_text("Move Robot %d Left.\n" % robots.find(active_robot))
	elif event.is_action_pressed("ui_right"):
		active_robot.input_direction = Vector2.RIGHT
		Global.console_io.print_text("Move Robot %d Right.\n" % robots.find(active_robot))
