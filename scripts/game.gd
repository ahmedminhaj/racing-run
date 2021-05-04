extends Node2D

onready var road = preload("res://Scenes/road.tscn")
onready var ene_car = preload("res://Scenes/ene_car.tscn")
onready var explosion = preload("res://Scenes/explosive.tscn")
onready var camera = $Camera

var car_timer = 0
var time = 74
var crash_time = 0

func _process(delta):
	time += 1
	car_timer += 1
	if car_timer > 50:
		var ins_car = ene_car.instance()
		car_timer = 0
		add_child(ins_car)
	if time > 73:
		var ins_road = road.instance()
		add_child(ins_road)
		time = 0

func _on_player_car_area_entered(area):
#	OS.delay_msec(200)
	camera_shake()
#	flash_scene()
	explosion()
	yield(get_tree().create_timer(0.4), "timeout")
	game_over()


func explosion():
	var car_crash = explosion.instance()
	car_crash.position = get_node("player_car").position
	add_child(car_crash)
	
func game_over():
	get_tree().change_scene("res://Scenes/game_over.tscn")

func camera_shake():
	print("shake")
	camera.start_shake(1, 0.02, 3)

func flash_scene():
	camera.start_flash(0.11,0.2)
