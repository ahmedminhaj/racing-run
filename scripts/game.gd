extends Node2D

onready var road = preload("res://Scenes/road.tscn")
onready var ene_car = preload("res://Scenes/ene_car.tscn")
onready var explosion = preload("res://Scenes/explosive.tscn")
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
#	crash_time += 1
	var car_crash = explosion.instance()
#	get_tree().paused
	car_crash.position = get_node("player_car").position
	add_child(car_crash)
	yield(get_tree().create_timer(0.3), "timeout")
	get_tree().change_scene("res://Scenes/game_over.tscn")
