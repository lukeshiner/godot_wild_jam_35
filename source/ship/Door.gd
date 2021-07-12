extends StaticBody2D

export(bool) var is_open = false

onready var sprite = $AnimatedSprite
onready var collider = $CollisionShape2D

func _ready():
	if is_open == true:
		sprite.frame = 29
		collider.disabled = true
	else:
		sprite.frame = 0


func door_toggle():
	if is_open == true:
		collider.set_deferred("disabled", false)
	sprite.play("", is_open)

func open():
	if is_open == false:
		door_toggle()

func close():
	if is_open == true:
		door_toggle()

func _on_AnimatedSprite_animation_finished():
	sprite.playing = false
	is_open = !is_open
	if is_open == true:
		sprite.frame = 29
		collider.set_deferred("disabled", true)
	else:
		sprite.frame = 0

func _input(event):
	if event.is_action_released("ui_page_down"):
		door_toggle()
