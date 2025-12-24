extends State

func enter():
	body.audioPlayer.play()
	body.velocity.y = -body.jumpSpeed
	
func doWallJump():
	if body.is_on_wall() && body.is_falling() && body.is_pressing_against_wall():
		body.velocity.y = 30
		
		if Input.is_action_just_pressed(Controls.JUMP):
			body.audioPlayer.play()
			body.acceleration += 12000 * -body.lastDirection
			body.velocity.y -= body.jumpSpeed
			
func physics_process(delta):	
	#short_jump
	if Input.is_action_just_released(Controls.JUMP):
		body.velocity.y *= 0.5
		
	var direction: float = Input.get_axis(Controls.LEFT, Controls.RIGHT)

	doWallJump()
	
	var currentMax: int = body.max_acceleration_run if Input.is_action_pressed(Controls.RUN) else body.max_acceleration
		
	if body.acceleration <= currentMax and body.acceleration >= -currentMax:
		body.acceleration += direction * body.acceleration_step

	if body.is_on_floor():
		state_machine.change_state(PlayerStates.RUN)
