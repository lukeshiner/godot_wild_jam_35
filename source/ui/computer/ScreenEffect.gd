extends ColorRect

var noise = OpenSimplexNoise.new()
var initial_darkening = material.get_shader_param("amount")
export(float) var speed = 50.0
export(float) var darkning_varience = 0.25

func _ready():
	noise.seed = randi()
	noise.period = 20.0
	noise.persistence = 0.8

func _process(_delta):
	var noise_amount = noise.get_noise_1d(OS.get_ticks_msec()/ speed)
	var offset = lerp(-darkning_varience, darkning_varience, noise_amount)
	var darkening = initial_darkening + offset
	material.set_shader_param("amount", darkening)

