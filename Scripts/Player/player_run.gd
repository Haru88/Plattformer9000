extends State

func physics_process(delta):	
	var direction: float = Input.get_axis(Controls.LEFT, Controls.RIGHT)
	
	var currentMax: int = player.max_acceleration_run if Input.is_action_pressed(Controls.RUN) else player.max_acceleration	
	if player.acceleration <= currentMax and player.acceleration >= -currentMax:
		player.acceleration += direction * player.acceleration_step
	
	if Input.is_action_just_pressed(Controls.JUMP) and player.is_on_floor():
		state_machine.change_state(PlayerStates.JUMP)
	
	if direction == 0: 
		state_machine.change_state(PlayerStates.IDLE)
