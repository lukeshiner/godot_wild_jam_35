extends Area2D

enum DIRECTIONS {
	UP, LEFT, DOWN, RIGHT
	UP, LEFT, DOWN, RIGHT
}

var directions = {
	DIRECTIONS.UP: Vector2.UP,
	DIRECTIONS.LEFT: Vector2.LEFT,
	DIRECTIONS.DOWN: Vector2.DOWN,
	DIRECTIONS.RIGHT: Vector2.RIGHT
}

var facing = Vector2.UP setget set_facing
var input_direction = Vector2.ZERO

export(DIRECTIONS) var start_facing

onready var tilemap = get_parent().get_node("TileMap")
onready var sprite = $Sprite
onready var action_timer = $ActionCooldown

func _ready():
	if start_facing:
		set_facing(directions[start_facing])

func set_facing(new_direction):
	facing = new_direction
	sprite.rotation = Vector2.UP.angle_to(new_direction)

func _unhandled_input(event):
	if event.is_action_pressed("ui_up"):
		input_direction = Vector2.UP
	elif event.is_action_pressed("ui_down"):
		input_direction = Vector2.DOWN
	elif event.is_action_pressed("ui_left"):
		input_direction = Vector2.LEFT
	elif event.is_action_pressed("ui_right"):
		input_direction = Vector2.RIGHT
	Global.console_io.print_text("Move Robot\n")


func move(direction):
	if facing == direction:
		var new_position = global_position + direction * 64
		if can_move(new_position):
			global_position = new_position
	else:
		set_facing(direction)
	input_direction = null
	action_timer.start()

func can_move(new_position):
	return tilemap.get_cellv(tilemap.world_to_map(new_position)) != -1

func _on_ActionCooldown_timeout():
	if input_direction:
		move(input_direction)
