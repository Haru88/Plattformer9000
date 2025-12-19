extends State

func physics_process(delta):
	print("idle")
	
	if Input.get_axis("Left", "Right") != 0:
		state_machine.change_state("Run")

	if Input.is_action_just_pressed("Jump") and player.is_on_floor():
		state_machine.change_state("Jump")
