extends Node2D


func _ready():
	var robots = get_tree().get_nodes_in_group("Robots")
	RobotController.add_robots(robots)
