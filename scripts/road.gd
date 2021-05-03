extends Sprite

func _ready():
	position.y = -600
	position.x = 0

func _process(delta):
	position.y += 8
	if position.y > 900:
		queue_free()
