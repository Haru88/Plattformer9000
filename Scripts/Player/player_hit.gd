extends State

@export var invisibleFrames: float = 5
@export var pushBackPower: float = 8000
@export var controlBlockTimeout: float = 0.3

func enter():
	print(body.CURRENT_ACCELERATION)
	print(body.LAST_DIRECTION)
	body.CURRENT_ACCELERATION = pushBackPower * -body.LAST_DIRECTION
	body.move_and_slide()
	await get_tree().create_timer(controlBlockTimeout).timeout
	state_machine.change_state(PlayerStates.RUN)
	pass
