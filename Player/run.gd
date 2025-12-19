extends State

func physics_process(delta):
	print("run")
	
	var direction: float = Input.get_axis("Left", "Right")
	
	var currentMax: int = player.max_acceleration_run if Input.is_action_pressed("Run") else player.max_acceleration
		
	if player.acceleration <= currentMax and player.acceleration >= -currentMax:
		player.acceleration += direction * player.acceleration_step
	
	if Input.is_action_just_pressed("Jump") and player.is_on_floor():
		state_machine.change_state("Jump")
	
	if direction == 0: 
		state_machine.change_state("Idle")
