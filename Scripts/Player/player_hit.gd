extends State

@export var invisibleFrames = 5
@export var pushBackPower = 8000
@export var controlBlockTimeout = 0.3

func enter():
	player.acceleration = pushBackPower * -player.lastDirection
	player.move_and_slide()
	await get_tree().create_timer(controlBlockTimeout).timeout
	state_machine.change_state(PlayerStates.RUN)
	pass
