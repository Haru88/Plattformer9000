extends State

func physics_process(_delta):	
	var direction: float = Input.get_axis(Controls.LEFT, Controls.RIGHT)
	
	var currentMax: int = body.max_acceleration_run if Input.is_action_pressed(Controls.RUN) else body.max_acceleration	
	print(currentMax)
	if body.CURRENT_ACCELERATION <= currentMax and body.CURRENT_ACCELERATION >= -currentMax:
		body.CURRENT_ACCELERATION += direction * body.acceleration_step
	print(body.CURRENT_ACCELERATION)
	 
	if Input.is_action_just_pressed(Controls.JUMP) and body.is_on_floor():
		state_machine.change_state(PlayerStates.JUMP)
	
	if direction == 0: 
		state_machine.change_state(PlayerStates.IDLE)
