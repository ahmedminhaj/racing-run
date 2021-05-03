extends Sprite

func _process(delta):
	position.y += 8
	if position.y > 900:
		queue_free()
