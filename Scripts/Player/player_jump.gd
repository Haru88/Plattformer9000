extends State

func enter():
	player.audioPlayer.play()
	player.velocity.y = -player.jumpSpeed
	
func doWallJump():
	if player.is_on_wall() && player.is_falling() && player.is_pressing_against_wall():
		player.velocity.y = 30
		
		if Input.is_action_just_pressed(Controls.JUMP):
			player.audioPlayer.play()
			player.acceleration += 12000 * -player.lastDirection
			player.velocity.y -= player.jumpSpeed
			
func physics_process(delta):	
	#short_jump
	if Input.is_action_just_released(Controls.JUMP):
		player.velocity.y *= 0.5
		
	var direction: float = Input.get_axis(Controls.LEFT, Controls.RIGHT)

	doWallJump()
	
	var currentMax: int = player.max_acceleration_run if Input.is_action_pressed(Controls.RUN) else player.max_acceleration
		
	if player.acceleration <= currentMax and player.acceleration >= -currentMax:
		player.acceleration += direction * player.acceleration_step

	if player.is_on_floor():
		state_machine.change_state(PlayerStates.RUN)
