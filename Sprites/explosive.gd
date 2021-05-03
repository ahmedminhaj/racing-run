extends Node2D


func _process(delta):
	$Particles2D.emitting = true
	$Particles2D/fire.emitting = true
	$Particles2D/smoke.emitting = true
	$Particles2D/lightSmoke.emitting = true
