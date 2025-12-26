extends State

@export var invisibleFrames = 5
@export var pushBackPower = 8000
@export var controlBlockTimeout = 0.3

func enter():
	body.CURRENT_ACCELERATION = pushBackPower * -body.LAST_DIRECTION
	body.move_and_slide()
	await get_tree().create_timer(controlBlockTimeout).timeout
	state_machine.change_state(PlayerStates.RUN)
	pass
