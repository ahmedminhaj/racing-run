extends Area2D


func _process(delta):
	if Input.is_action_pressed("ui_left"):
		position.x -= 15
	if Input.is_action_pressed("ui_right"):
		position.x += 15
	if Input.is_action_pressed("ui_up"):
		position.y -= 15
	if Input.is_action_pressed("ui_down"):
		position.y += 15
	position.x = clamp(position.x, 100, 350)
	position.y = clamp(position.y, 50, 550)


