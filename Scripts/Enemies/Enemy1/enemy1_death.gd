extends State

func enter():
	print("death")
	body.MOVEMENT_SPEED = 0
	body.ANIMATION.play("death")
