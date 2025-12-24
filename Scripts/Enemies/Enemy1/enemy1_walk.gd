extends State

func enter():
	body.ANIMATION.play("Run")

func physics_process(delta):
	body.ANIMATION.scale.x = -body.CURRENT_DIRECTION
	if not body.is_on_floor():
		body.velocity.y += body.get_gravity().y * delta
		body.move_and_slide()
		return
		
	if not body.RIGHT_FLOOR.is_colliding() or not body.LEFT_FLOOR.is_colliding():
		body.CURRENT_DIRECTION *= -1
