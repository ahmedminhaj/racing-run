extends Camera2D

onready var timer : Timer = $Timer

export var amplitude : = 6.0
export var duration : = 0.8 
export(float, EASE) var DAMP_EASING : = 1.0
export var shake : = false setget set_shake

func _ready():
	randomize()
	set_process(false)
	self.duration = duration
	_on_camera_shake_requested()

func _process(delta: float):
	var damping : = ease(timer.time_left / timer.wait_time, DAMP_EASING)
	offset = Vector2(
		rand_range(amplitude, -amplitude) * damping,
		rand_range(amplitude, -amplitude) * damping)

func _on_ShakeTimer_timeout():
	self.shake = false

func _on_camera_shake_requested():
	self.shake = true
	

func set_shake(value: bool):
	shake = value
	set_process(shake)
	offset = Vector2()
	if shake:
		timer.start()
