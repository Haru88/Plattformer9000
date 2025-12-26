extends State

func enter():
	print("death")
	body.MOVEMENT_SPEED = 0
	body.ANIMATION.play("death")
	await get_tree().create_timer(0.1).timeout
	get_parent().get_parent().queue_free()
