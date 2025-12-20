extends State

func enter():
	player.audioPlayer.play()
	player.velocity.y -= player.jumpSpeed
	
func doWallJump():
	print(player.is_pressing_against_wall())
	if player.is_on_wall() && player.is_falling() && player.is_pressing_against_wall():
		player.velocity.y = 30
		
		if Input.is_action_just_pressed("Jump"):
			player.audioPlayer.play()
			player.acceleration += 12000 * -player.lastDirection
			player.velocity.y -= player.jumpSpeed
			
func physics_process(delta):
	print("jump")
	
	if Input.is_action_just_released("Jump"):
		player.velocity.y *= 0.5
		
	var direction: float = Input.get_axis("Left", "Right")

	doWallJump()
	
	var currentMax: int = player.max_acceleration_run if Input.is_action_pressed("Run") else player.max_acceleration
		
	if player.acceleration <= currentMax and player.acceleration >= -currentMax:
		player.acceleration += direction * player.acceleration_step

	if player.is_on_floor():
		state_machine.change_state("Run")
