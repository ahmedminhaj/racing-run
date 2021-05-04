extends Camera2D

onready var timer_shake = $timer_shake_length
onready var timer_wait = $timer_wait_times
onready var tween_shake = $tween_camera_shake
onready var flash = $flash

var reset_speed = 0
var strength = 0
var doing_shake = false

func _ready():
	timer_wait.connect("timeout", self, 'timeout_wait_times')
	timer_shake.connect("timeout", self, "timeout_shake_length")

func timeout_shake_length():
	doing_shake = false
	reset_camera()

func timeout_wait_times():
	if(doing_shake):
		tween_shake.interpolate_property(self, "offset", offset, Vector2(rand_range(-strength,strength), rand_range(-strength,strength)), reset_speed,Tween.TRANS_SINE,Tween.EASE_OUT)
		tween_shake.start()

func reset_camera():
	tween_shake.interpolate_property(self, "offset", offset, Vector2(0,0), reset_speed,Tween.TRANS_SINE,Tween.EASE_OUT)
	tween_shake.start()

func start_shake(time_of_shake, speed_of_shake, strength_of_shake):
	print("start Shake")
	doing_shake = true
	strength = strength_of_shake
	reset_speed = speed_of_shake
	timer_shake.start(time_of_shake)
	timer_wait.start(speed_of_shake)
	
func start_flash(speed, strength):
	tween_shake.interpolate_property(flash, "modulate:a", 0, strength, speed, Tween.TRANS_SINE, Tween.EASE_OUT)
	tween_shake.start()
	
	yield(get_tree().create_timer(speed), "timeout")
	tween_shake.interpolate_property(flash, "modulate:a", 0, strength, speed, Tween.TRANS_SINE, Tween.EASE_OUT)
	tween_shake.start()





