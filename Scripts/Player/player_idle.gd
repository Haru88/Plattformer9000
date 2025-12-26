extends State

func physics_process(_delta):	
	if Input.get_axis(Controls.LEFT, Controls.RIGHT) != 0:
		state_machine.change_state(PlayerStates.RUN)

	if Input.is_action_just_pressed(Controls.JUMP) and body.is_on_floor():
		state_machine.change_state(PlayerStates.JUMP)
