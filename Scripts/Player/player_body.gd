class_name Player extends CharacterBody2D

@export_group("Refs")
@export var rayCastL: RayCast2D
@export var rayCastR: RayCast2D
@export var audioPlayer: AudioStreamPlayer

@export_group("PlayerStats")
@export var walkSpeed = 5000
@export var jumpSpeed = 330
@export var friction = 300
@export var acceleration_step = 600
@export var acceleration_run = 400
@export var max_acceleration = 5000
@export var max_acceleration_run = 10000

var acceleration = 0
var lastDirection = 1.0

func _physics_process(delta: float) -> void:
	
	var direction = Input.get_axis(Controls.LEFT, Controls.RIGHT)
	if(direction != 0):
		lastDirection = direction
	
	var gravity = get_gravity().y
	
	if not is_on_floor():			
		velocity.y += gravity * delta		
	
	if acceleration > 0:
		if acceleration <= friction:
			acceleration = 0
		else:
			acceleration -= friction
	elif acceleration < 0:
		if acceleration >= friction:
			acceleration = 0
		else:
			acceleration += friction	
							
	velocity.x = acceleration * delta 
	
	move_and_slide()
	
	if is_on_wall(): 
		velocity.x = 5 * direction
		acceleration = 0
		
func is_pressing_against_wall() -> bool:
	return (Input.is_action_pressed(Controls.RIGHT) and rayCastR.is_colliding()) or (Input.is_action_pressed(Controls.LEFT) and rayCastL.is_colliding())

func is_falling() -> bool:
	return velocity.y > 0
