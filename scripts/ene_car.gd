extends Area2D

func _ready():
	randomize()
	position.x = rand_range(100, 350)
	position.y = -350

func _process(delta):
	position.y += 10
